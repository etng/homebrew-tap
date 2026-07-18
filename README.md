# etng Homebrew Tap

通过 Homebrew 安装和更新 etng 的 macOS 工具。

## The Whispers for IINA

为 IINA 安装渐进式双语字幕插件、组件管理器和后台 worker：

```bash
brew install etng/tap/the-whispers-for-iina
whispersctl setup
```

安装向导会先探测可复用工具和共享模型，再显示将要安装或下载的组件。公开发行包与校验文件见 [The Whispers for IINA Releases](https://github.com/etng/the-whispers-for-iina/releases)。

## osd-notify

`osd-notify` 来自私有 GitHub 仓库，安装前请先让 GitHub CLI 登录有权访问该仓库的账号：

```bash
gh auth login
brew install etng/tap/osd-notify
```

检查并安装后续稳定版本：

```bash
brew update
brew outdated osd-notify
brew upgrade osd-notify
```

## Codex Bro

```bash
brew install --cask etng/tap/codex-bro
```

Homebrew 会在稳定版本发布后获取最新配方；私有下载所需的 GitHub 凭据会沿用 GitHub CLI 的登录状态。
