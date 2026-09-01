class Vessel < Formula
  desc "Lightweight, local-first observability proxy for LLM traffic"
  homepage "https://github.com/spenceclark/Vessel"
  license "MIT"
  version "0.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.0.0/vessel-0.0.0-osx-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      odie "vessel: Intel Macs aren't published by this tap; build from source (https://github.com/spenceclark/Vessel)."
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.0.0/vessel-0.0.0-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/spenceclark/Vessel/releases/download/v0.0.0/vessel-0.0.0-linux-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "vessel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vessel --version")
  end
end
