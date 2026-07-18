# typed: strict
# frozen_string_literal: true

# Installs The Whispers for IINA runtime and component manager.
class TheWhispersForIina < Formula
  desc "Local progressive bilingual subtitles for IINA"
  homepage "https://github.com/etng/the-whispers-for-iina"
  url "https://github.com/etng/the-whispers-for-iina/releases/download/v0.3.1/the-whispers-for-iina-0.3.1-macos-arm64.tar.gz"
  version "0.3.1"
  sha256 "7006aa2532eb7f893220ef15d973a19588db2f8ac8157a0d84f69d9c86f2b71a"
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
