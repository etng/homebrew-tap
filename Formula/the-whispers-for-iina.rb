# typed: strict
# frozen_string_literal: true

# Installs The Whispers for IINA runtime and component manager.
class TheWhispersForIina < Formula
  desc "Local progressive bilingual subtitles for IINA"
  homepage "https://github.com/etng/the-whispers-for-iina"
  version "0.3.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/etng/the-whispers-for-iina/releases/download/v0.3.2/the-whispers-for-iina-0.3.2-macos-arm64.tar.gz"
    sha256 "a81a552321f10f7b7a7e1f6152817abba7f4ffdc9b3e80d3c650d7ed73106a4b"
  else
    url "https://github.com/etng/the-whispers-for-iina/releases/download/v0.3.2/the-whispers-for-iina-0.3.2-macos-x86_64.tar.gz"
    sha256 "af38d4811f477f53e31d66f30db84bff958cb1982ce9440e074da20eb9b305b2"
  end

  def install
    libexec.install Dir["runtime/*"]
    bin.install_symlink libexec/"bin/whispersctl"
  end

  def caveats
    setup_command = if Hardware::CPU.intel?
      "whispersctl setup --profile viewer"
    else
      "whispersctl setup"
    end
    <<~EOS
      运行以下命令选择组件、复用已有模型并安装 IINA 插件：
        #{setup_command}

      Intel 包为只看版，只从公开字幕仓库匹配和加载材料，不下载本地模型。
      Apple Silicon 默认不会下载模型，直到安装计划显示并得到你的确认。
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whispersctl version")
    assert_match "whisper-tiny-multilingual", shell_output("#{bin}/whispersctl models catalog --json")
  end
end
