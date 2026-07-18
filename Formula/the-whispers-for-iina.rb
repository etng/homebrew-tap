# typed: strict
# frozen_string_literal: true

# Installs The Whispers for IINA runtime and component manager.
class TheWhispersForIina < Formula
  desc "Local progressive bilingual subtitles for IINA"
  homepage "https://github.com/etng/the-whispers-for-iina"
  url "https://github.com/etng/the-whispers-for-iina/releases/download/v0.3.0/the-whispers-for-iina-0.3.0-macos-arm64.tar.gz"
  version "0.3.0"
  sha256 "f9fd9039efc510d6d0ff4f0c2f293fa24b43e9b7e5c08a64c02b5b8a1c9e279b"
  license "MIT"

  depends_on arch: :arm64

  def install
    libexec.install Dir["runtime/*"]
    bin.install_symlink libexec/"bin/whispersctl"
  end

  def caveats
    <<~EOS
      运行以下命令选择组件、复用已有模型并安装 IINA 插件：
        whispersctl setup

      默认不会下载模型，直到安装计划显示并得到你的确认。
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whispersctl version")
    assert_match "whisper-tiny-multilingual", shell_output("#{bin}/whispersctl models catalog --json")
  end
end
