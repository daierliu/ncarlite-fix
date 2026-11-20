# patch/ — 补丁文件说明（当前进度同步）

构建时 `scripts\build.ps1` 会：

1. 把 `patch\smali\com\car\musiclite\*.smali` 全部覆盖到反编译目录；
2. 把 `patch\res\*` 覆盖到反编译资源目录；
3. 每构建一次 `versionCode` 自动 +1（计数器：`scripts\versionCode.txt`，2026-11-18 为 43）。

当前共 **28 个 smali + 1 个资源文件**。按功能分组如下。

## 一、登录 / 接口修复（2026-11-16）

| 文件 | 改动 |
|---|---|
| `Api.smali` | ① `post(String,String)` 重写：JSON → query 参数 → **GET `https://music.163.com/api<path>?<query>`**（跳过 `csrf_token` 与 `JSONObject.NULL`；字符串直取，其余 `toString()` 后 URL 编码）。② 新增 `postGet / postGetOnce / postGetTrustAll / doGet`（超时、UA/Referer/Accept-*、buildCookie、捕获 Set-Cookie、gzip 解压、SSLException → trust-all 重试）。 |
| `Api$5.smali` | 每日推荐解析键 `"songs"` → `"dailySongs"`。 |
| `Zx.smali` | 二维码反色修复：命中位 → 纯黑 `-0x1000000`，未命中 → 纯白 `-0x1`。 |
| `MainActivity$14.smali` | 二维码位图尺寸 `0xdc`(220px) → `0x1b8`(440px)。 |

> 2026-11-18 修复：`post()` 拼 URL 时漏了 `?`（生成 `.../unikeytype=3`），导致所有接口整包 404「接口未找到」。已在 `:cond_3` 处补 `?`（query 为空则不加）。详见 `docs\findings.md`「根因 3」。

## 二、界面改造（2026-11-17 晚间）

程序化 UI（无 layout xml），全部在 `MainActivity.smali` 及匿名类中。

| 文件 | 改动 |
|---|---|
| `MainActivity.smali` | 重写界面构建：`buildUi` / `buildLoginView` / `showScreen` / `openLogin` / `showLyrics` / `hideLyrics` / 搜索 / 歌单 / 队列；颜色助手 `bgWindow` `bgPanel` `bgSearch` `bgPlaying` `textMain` `textSub` `textHint` `accent`；列表缓存 `saveListCache` / `loadListCache`；**3 模主题**：`mode` 0=自动 1=白天 2=夜晚，`isNight()` + `applyMode()` + `autoTick()`。 |
| `MainActivity$DarkBtn.smali` | 主题切换按钮：`mode = (mode+1) % 3`，写入 SharedPreferences `ui/mode`，`recreate()`。 |
| `MainActivity$ModeBtn.smali` | 播放模式按钮（列表/单曲循环等）。 |
| `MainActivity$BackBtn.smali` / `$LyricOpen.smali` | 返回 / 歌词面板开关。 |
| `MainActivity$SeekTouch.smali` | 进度条触摸拖动。 |
| `MainActivity$Breath.smali` | 封面呼吸动画（缩放 0.9375~1.0）。 |
| `MainActivity$HomeAdapter.smali` / `$SongAdapter.smali` | 首页/歌曲列表适配器（白卡片、缩略图、播放中高亮）。 |
| `MainActivity$CoverTask.smali` `$CoverRun.smali` `$ThumbTask.smali` `$ThumbRun.smali` `$CacheW.smali` | 封面/缩略图异步下载与缓存。 |
| `MainActivity$1.smali` `$10$1` `$11` `$12` `$13` | 原有 AsyncTask/广播匿名类的配套适配。 |
| `LyricsBox.smali` `LyricsBox$Render.smali` `LyricsBox$Cover.smali` | 歌词框渲染与封面绘制。 |
| `PlayerService.smali` / `PlayerService$5.smali` | 播放服务：通知栏、媒体按键、进度广播、音频焦点、RCC 元数据。 |
| `res\values\styles.xml` | `CarTheme`：白色 `windowBackground` + 全屏（`Theme.DeviceDefault.NoActionBar`）。 |

> 2026-11-18 修复「黑底」：`isNight()` 原逻辑 `hour >= 6` 即判夜晚，导致 6:00-18:59 也走深色主题；已改为 `hour < 6 或 >= 19` 才算夜晚。同时默认模式 `0(自动)` → `1(白天)`，新装/清数据后直接亮色。模式按钮仍可切回自动/夜晚（选择持久化在 `ui/mode`）。

## 三、构建产物

- `out\NeteaseCarLite-v1.0.0-loginfix.apk` —— 完整版（登录修复 + 界面改造 + 主题修复），hybrid.keystore v1+v2+v3 签名。
- `out\NeteaseCarLite-v1.0.0-loginfix-light.apk` —— 2026-11-17 的浅色试验版（历史产物，不含登录 `?` 修复）。
