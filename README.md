[README.md](https://github.com/user-attachments/files/35138949/README.md)
车机 GEELY Android 4.3 v
# 云音乐 Lite — APK 备车机 GEELY Android 4.3

## 应用信息

| 项目 | 值 |
|------|-----|
| 应用名 | 云音乐 Lite（车机音乐应用） |
| 包名 | `com.car.musiclite` |
| 版本 | 1.0.0 (versionCode=1) |
| minSdk | 18（Android 4.3） |
| targetSdk | 28（Android 9） |
| APK 文件 | `yun-music-lite-1.0.0.apk`（约 882 KB） |
| 提取来源 | 小米 10 (umi)，无线 ADB 192.168.1.9:43475 |
| 提取日期 | 2026-11-17 |

## 备注

- 从包名 `com.car.musiclite` 看，这是一款车机端音乐播放应用。
- 后续开工时可反编译分析（如 `apktool` / `jadx`），或直接作为功能参考。

## 相关资源（重要）

`C:\Users\Autistic\Documents\默认项目\` 下有本项目的前期完整资料：

| 目录 | 内容 |
|------|------|
| `APK/` | NeteaseCarLite v1.0.0 自建包（debug/release）、NeteaseCarWebPlayer v1.0.0 |
| `ncarlite-fix/` | **同款应用（com.car.musiclite）的登录修复项目**：findings.md 分析文档、smali 补丁（weapi POST 改 /api GET 通道、二维码反色修复、二维码放大 440px）、build.ps1 一键重打包、10 个网易 API 诊断脚本 |
| `wyy431-loginfix/` | 网易云音乐 4.3.1 老客户端登录修复版（同车机 GEELY Android 4.3），含 apktool 工作区、jadx 源码、自包含工具链（apktool.jar、buildtools、jre17、签名密钥 hybrid.keystore 密码 android） |
| `apk-analysis/` | apktool/jadx 工具链 + 其他版本（v75/v85）反编译分析 |
| `l1panel/` | L1 歌词面板项目：v4.1 设计文档、图标生成脚本、keystore、签名产物 |
| `odexwork/` | 车机 UI 效果图（HTML 原型：三形态、L1 歌词面板、桌面增强包） |

### 关键技术结论（摘自 ncarlite-fix/docs/findings.md）

- 应用为原生 UI + 直连网易 API，自有代码仅 7 个类（Api/Crypto/Zx/MainActivity/PlayerService 等）。
- 网易 `music.163.com/weapi/*` POST 已被服务端按 TLS/HTTP2 指纹拦截；**经典 `/api/*` GET 通道仍可用**，全部所需接口（登录二维码、搜索、歌单、播放地址、每日推荐等 8+ 个）均已验证等价。
- 登录链路：`/api/login/qrcode/unikey?type=3` → 轮询 `client/login` → 从 Set-Cookie 抓 `MUSIC_U`。

### 备注

- 手机上提取的 APK（SHA-256 `7709da05…`）与本地 `APK/` 内 4 个包及 loginfix 产物哈希均不一致，可能是不同签名的构建，待后续比对。
- GEELY 车机 adb：`10.238.95.238:5555`（Android 4.3）。
