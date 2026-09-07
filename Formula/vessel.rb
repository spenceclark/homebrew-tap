class Vessel < Formula
  desc "Lightweight, local-first observability proxy for LLM traffic"
  homepage "https://github.com/spenceclark/Vessel"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.2.0/vessel-0.2.0-osx-arm64.tar.gz"
      sha256 "a61c015da0ed4c497299cd627dec4b4a5bc1869afeec808818782f42197c7f44"
    else
      odie "vessel: Intel Macs aren't published by this tap; build from source (https://github.com/spenceclark/Vessel)."
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.2.0/vessel-0.2.0-linux-arm64.tar.gz"
      sha256 "4595135b5f972a341bddb70f75e25fb8e8f16d34d5895e70828202787326ef22"
    else
      url "https://github.com/spenceclark/Vessel/releases/download/v0.2.0/vessel-0.2.0-linux-x64.tar.gz"
      sha256 "3a1eab27ab95c19472858f3b557ebffe1cca6529824580508dd43370ee32724b"
    end
  end

  def install
    bin.install "vessel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vessel --version")
  end
end
