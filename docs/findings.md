# NeteaseCarLite-v1.0.0 登录修复 —— 分析与补丁记录

- 目标 APK：`com.car.musiclite`（NeteaseCarLite v1.0.0，GEELY 车机，Android 4.3 / minSdk 18 / targetSdk 28）
- 产出：`out/NeteaseCarLite-v1.0.0-loginfix.apk`（hybrid.keystore 签名，v1+v2+v3）
- 分析工具：apktool 2.9.3、jadx（`apk-analysis\tools\jadx`）、PC 端复刻脚本（`scripts\ncm-*.ps1`）

---

## 一、症状

车机端打开 App 后二维码能显示，但手机网易云 App 扫码后车机一直停在"等待扫码"，无法完成登录。

## 二、App 结构

非 WebView 壳，原生 UI + 直连网易 API。自有代码仅 7 个类（`com.car.musiclite`）：

| 类 | 职责 |
|---|---|
| `Api` | HTTP 层：`post(path, json)` 统一走 `/weapi` POST；cookie 捕获、trust-all 重试 |
| `Crypto` | 标准 weapi 加密（AES 双层 + RSA 无填充），密钥与网易标准一致 |
| `Zx` | zxing 生成二维码 Bitmap |
| `MainActivity` | UI + 轮询（qrPoll 801/802/803） |
| `PlayerService` 等 | 播放 |

登录链路：`post("/login/qrcode/unikey", {"type":3})` → 二维码 `https://music.163.com/login?codekey=<unikey>` → `post("/login/qrcode/client/login", {"key":..,"type":3})` 轮询 → 从 `Set-Cookie` 抓 `MUSIC_U`/`__csrf` 存入 SharedPreferences（"ncm"）。

App 内部为 Android 4.3 强制启用了 TLSv1.2（`App.Tls12Factory`），证书校验失败时还有 trust-all 重试，这部分没有问题。

## 三、根因

### 根因 1：二维码是反色的（必现、致命）

`Zx.qrBitmap` 把 BitMatrix 的**黑色模块渲染成白色 `-1`**，背景渲染成深青色 `-0xebebe8`。生成的是"深底白点"反色二维码，网易 App 扫一扫识别率极低。补丁：黑色模块 → 纯黑 `-0x1000000`，背景 → 纯白 `-0x1`；同时把二维码从 220px 放大到 440px（车机屏大、手机镜头远）。

### 根因 2：`/weapi` POST 被网易 WAF 按 TLS/HTTP2 指纹拦截（必现、致命）

PC 复刻实验（`scripts\ncm-diag1..8.ps1`，加密实现与 APK 完全一致、RSA 模数逐字节核对相同）：

1. 用 PowerShell 发 `/weapi/*` POST（全套浏览器头：UA、Referer、Origin、sec-ch-ua、sec-fetch-*、x-os: web、Cookie）→ 返回 `{"code":404,"message":"接口未找到"}` 或 200 空体。
2. 同一台 PC、同一网络，**浏览器页面上下文内**发同样请求（连 `credentials:"omit"` 都试过）→ 一律成功拿到 `unikey` / 轮询 801。
3. 垃圾密文返回 200 空体，而正确密文返回 `404 接口未找到` → 说明服务端解密成功、是**路由阶段按客户端特征拒绝**。
4. 结论：`music.163.com/weapi/*` 的 POST 只对浏览器 TLS/HTTP2 指纹放行（volc-dcdn 边缘节点），对非浏览器客户端（Java HttpURLConnection 必然命中）全部拦截。**这不是 App 代码 bug，是服务端策略变化** —— 同样的代码在早年可用。

### 出路：经典 `/api/*` GET 通道未被封

`/api/<path>?<query>` GET 从 PowerShell（非浏览器、无任何特殊指纹）直接可达，且返回 JSON 与 weapi 同构。对 App 用到的全部 8 个接口逐一验证（`scripts\ncm-diag5/6/7/9.ps1`，含 App 精确参数组合）：

| App 调用（weapi POST） | /api GET 等价 | 返回形状 | 验证 |
|---|---|---|---|
| `/login/qrcode/unikey` `{"type":3}` | `/api/login/qrcode/unikey?type=3` | 顶层 `unikey` | OK |
| `/login/qrcode/client/login` `{"key":..,"type":3}` | `/api/login/qrcode/client/login?key=..&type=3` | 顶层 `code`(801/802/803) | OK |
| `/cloudsearch/pc` | `/api/cloudsearch/pc?s=..&type=1&limit=30&offset=0&total=true` | `result.songs` | OK |
| `/search/get`（fallback） | `/api/search/get?s=..` | `result.songs` | OK |
| `/v6/playlist/detail` `{"id":..,"n":1000,"s":8}` | `/api/v6/playlist/detail?id=..&n=1000&s=8` | 顶层 `playlist`（tracks/trackIds 兜底逻辑不变） | OK |
| `/song/detail` `{"ids":[..]}` | `/api/song/detail?ids=%5B..%5D` | `songs` | OK |
| `/user/playlist` | `/api/user/playlist?uid=..&limit=60&offset=0&includeVideo=true` | `playlist` 数组 | OK |
| `/w/nuser/account/get` `{}` | `/api/w/nuser/account/get`（无参数也可） | 顶层 `profile` | OK |
| `/song/enhance/player/url/v1` | `/api/song/enhance/player/url/v1?ids=%5B..%5D&level=standard&encodeType=mp3` | `data[].url`（匿名可取真链） | OK |
| `/v3/discovery/recommend/songs` | `/api/v3/discovery/recommend/songs?limit=50&total=true` | `data.dailySongs` | OK |

另验证：`/api` **不接受** POST+JSON body（一律 400），必须 query 参数 —— 所以补丁把 JSON 解析成 query 后用 GET 发送。

### 根因 3：补丁自身 bug —— `?` 遗漏（2026-11-18 由手机端日志定位）

首版 `Api.post()` 重写把 query 直接拼在 path 后面，漏掉了 `?`：

```
https://music.163.com/api/login/qrcode/unikeytype=3    ← 实际发出（错误）
https://music.163.com/api/login/qrcode/unikey?type=3   ← 应该
```

设备侧表现：HTTP 200 + 响应体 `{"code":404,"message":"接口未找到！"}`（网易 API 路由器的"未知路径"标准响应，PC 上用乱路径 curl 请求可复现一字不差的 JSON），随后 `Api$8` 抛 `IllegalStateException: unikey empty`，界面上二维码不显示、排行榜也不出声（所有接口都 404）。

当时一度误判为"WAF 按客户端指纹拦截手机"，以下证据推翻了该判断：

- 同一手机、同一网络，浏览器打开同 URL → 200 + `unikey`；
- 在应用进程内直接裸 `HttpURLConnection` 请求 `interface.music.163.com/api/login/qrcode/unikey?type=3` → 200 + `unikey`（Conscrypt/HTTP1.1 完全未被拦）；
- PC 用 curl 加与 App 完全相同的请求头（UA/Referer/Cookie `os=pc; appver=…`/gzip）→ 200。

结论：`/api` GET 通道对非浏览器客户端没有指纹限制，问题纯粹是 URL 拼接 bug。修复：`post()` 在 query 非空时先追加 `?`（干净补丁 `Api.smali` `:cond_3` 处）。

### 设备侧诊断方法（可复用）

- 手机（Mi 10 / Android 13）无线 adb：`$env:ANDROID_ADB_SERVER_PORT="5557"`，抓 `MusicLite.Api:I MusicLite.Req:I MusicLite.Resp:I MusicLite.Alt:I`。
- 诊断日志只加在临时反编译目录（`C:\Temp\carlite\work`），不进 `patch\`：`post()` 打印最终 URL + DNS 解析结果；`doGet()` 打印 Cookie、响应码、响应头；`Api$8` 打印响应 JSON。
- MIUI 无线 adb 不能注入触摸（`INJECT_EVENTS` SecurityException），屏幕操作需人工；`screencap` / `logcat` / `am start` / `monkey` 可用。
- 本机对照实验：`curl --tlsv1.2` + 乱路径 → 401/404 标准 JSON，用于区分"路由没找到"与"客户端被拦"。

## 四、补丁内容（28 个 smali + 1 个资源，详见 `patch\README.md`）

| 组 | 文件 | 要点 |
|---|---|---|
| 登录/接口 | `Api.smali`、`Api$5.smali` | `post()` → GET `/api`；`?` 修复；`postGet*/doGet`；推荐键 `dailySongs` |
| 二维码 | `Zx.smali`、`MainActivity$14.smali` | 黑白反色修复、220→440px |
| 界面 | `MainActivity.smali` + 17 个匿名类 + `LyricsBox*` + `PlayerService*` | 程序化 UI、白色主题、3 模主题（自动/白天/夜晚）、列表/封面/歌词/拖动/呼吸动画 |
| 资源 | `res\values\styles.xml` | 白色 `CarTheme` + 全屏 |

构建：`scripts\build.ps1`（apktool 反编译原 APK → 覆盖全部补丁 smali + res → 回编译 → zipalign → apksigner v1+v2+v3 签名 → verify → 输出 `out\`），每次构建 `versionCode` 自动 +1（`scripts\versionCode.txt`，当前 43）。加 `-Install` 直接 adb 连车机安装（`ANDROID_ADB_SERVER_PORT=5557`）。

### 界面美化与"黑底"修复（2026-11-17 / 18）

- 11-17 晚完成整体换肤：白色窗口（`CarTheme`）、白色卡片列表、封面呼吸动画、播放中高亮、歌词框、拖动条、播放模式/返回/歌词按钮等，全部程序化实现（无 layout xml）。
- 主题系统：`mode` 0=自动（按 `isNight()`）1=白天 2=夜晚，`DarkBtn` 循环切换并持久化在 SharedPreferences `ui/mode`。
- 11-18 修复：`isNight()` 原逻辑 `hour >= 6` 判夜晚，导致 **6:00-18:59 也黑底**；改为 `hour < 6 或 >= 19` 才是夜晚。默认模式由 0（自动）改为 1（白天），新装/清数据后直接亮色。

## 五、验证步骤

### 手机验证（Android 13，无需车机）

1. `adb -s <手机ip:端口> install -r out\NeteaseCarLite-v1.0.0-loginfix.apk`（`ANDROID_ADB_SERVER_PORT=5557`），然后 `adb shell pm clear com.car.musiclite`（重置主题/登录状态）→ `adb shell monkey -p com.car.musiclite -c android.intent.category.LAUNCHER 1`。
2. 界面应直接为白色主题（默认 mode=1 白天）；点「登录账号」应显示 440px 黑白二维码。
3. logcat：`unikey` 应 200；轮询 `qrPoll` 801→802→803；登录后 `cookies updated, logged in=...`。
4. 扫码登录成功后验证歌单/排行/搜索/播放，`MusicLite.Api` 不应再出现 `api failed`。

### 车机端验证（车机开机后）

1. `scripts\build.ps1 -Install`（或单独 `adb -s 10.238.95.238:5555 install -r out\NeteaseCarLite-v1.0.0-loginfix.apk`）。
   注意：`com.car.musiclite` 可能是预装系统应用，普通 install 会因签名不同报 `INSTALL_FAILED_UPDATE_INCOMPATIBLE`；车机已 root（KingRoot），可先 `su -c pm uninstall com.car.musiclite` 或 `adb shell su -c "rm -rf /system/app/NeteaseCarLite*"` 再装。
2. `scripts\test.ps1`：连接 → 启动 App → 抓 `MusicLite.Api` 日志（应看到 `cookies updated, logged in=...`）→ 读取 `su -c cat /data/data/com.car.musiclite/shared_prefs/ncm.xml` 确认 `MUSIC_U`。
3. 车机显示黑白二维码 → 手机网易云 App 扫码 → 车机自动进入已登录状态 → 播放每日推荐/搜索/歌单验证全链路。

## 六、遗留与备注

- `Api.smali` 中 weapi 旧路径代码未删除（死代码，减小 diff 风险；若想清理可删 `postForm*`/`doForm` 及 `Crypto.weapi`）。
- 网易若日后连 `/api` GET 也封指纹，则只剩 eapi（设备端加密通道）方案，需引入设备指纹，工作量大得多。
- 反色二维码根因解释了"扫码无反应"的一半；`?` 遗漏解释了接口全挂的另一半。
- 主题：默认白天（mode=1）；`DarkBtn` 可切 1(白天)→2(夜晚)→0(自动)。夜晚模式保留深色是设计如此，若完全不要深色可去掉 `DarkBtn` 循环或强制 mode=1。
- `out\NeteaseCarLite-v1.0.0-loginfix-light.apk` 是 11-17 的浅色试验版（不含 `?` 修复），仅作历史参考，勿分发。
- 构建用 `versionCode` 递增（`scripts\versionCode.txt`），便于车机覆盖安装策略放行；当前为 43。
- PC 复刻脚本族：`ncm-lib.ps1`（weapi 复刻库，含从网页流程抓到的真实行为）、`ncm-diag1..9.ps1`（证据链）、`ncm-api-test.ps1`（早期验证）。
- 网易页面上下文的反爬 JS 会 hook `BigInt("0x..")`（返回 undefined），复刻时用 `5n` 字面量或 `eval("0x..n")` 绕过（见 diag 记录）。
