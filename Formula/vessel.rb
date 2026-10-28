class Vessel < Formula
  desc "Lightweight, local-first observability proxy for LLM traffic"
  homepage "https://github.com/spenceclark/Vessel"
  license "MIT"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.3.2/vessel-0.3.2-osx-arm64.tar.gz"
      sha256 "c28f81f7d78b31b159e5064e55e043909cd8347eca4fdc8dff5c99bc2ef65b95"
    else
      odie "vessel: Intel Macs aren't published by this tap; build from source (https://github.com/spenceclark/Vessel)."
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.3.2/vessel-0.3.2-linux-arm64.tar.gz"
      sha256 "4f6719527dcf9ab9203513ae4c94d5918249d6a1265cff1a2678b67800fc9e2d"
    else
      url "https://github.com/spenceclark/Vessel/releases/download/v0.3.2/vessel-0.3.2-linux-x64.tar.gz"
      sha256 "ac5e019260c3adb97a9878729402c9b00ce0229caf70c8be02dc49d901ec2202"
    end
  end

  def install
    bin.install "vessel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vessel --version")
  end
end
