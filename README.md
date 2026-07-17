# etng Homebrew Tap

通过 Homebrew 安装和更新 etng 的 macOS 工具。

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
