class Vessel < Formula
  desc "Lightweight, local-first observability proxy for LLM traffic"
  homepage "https://github.com/spenceclark/Vessel"
  license "MIT"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.3.1/vessel-0.3.1-osx-arm64.tar.gz"
      sha256 "0a440373a8c503f98c48419669d8027bb9b31d957d1072efc4d0c86dd57f03e9"
    else
      odie "vessel: Intel Macs aren't published by this tap; build from source (https://github.com/spenceclark/Vessel)."
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.3.1/vessel-0.3.1-linux-arm64.tar.gz"
      sha256 "7a6f956eec9c0357d323bf5943787fec61bcd08e5fe9f61095a2b0d0587ebf5e"
    else
      url "https://github.com/spenceclark/Vessel/releases/download/v0.3.1/vessel-0.3.1-linux-x64.tar.gz"
      sha256 "cf2c2e15c64635be0bec06ae34e7acc1de08946ae5f409b379cddcae00e5e79e"
    end
  end

  def install
    bin.install "vessel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vessel --version")
  end
end
