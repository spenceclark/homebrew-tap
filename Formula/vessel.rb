class Vessel < Formula
  desc "Lightweight, local-first observability proxy for LLM traffic"
  homepage "https://github.com/spenceclark/Vessel"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.2.1/vessel-0.2.1-osx-arm64.tar.gz"
      sha256 "efdab3e439a5b346dc18aa5cf1828f534447ded8bce594eb778c441a947eb5c1"
    else
      odie "vessel: Intel Macs aren't published by this tap; build from source (https://github.com/spenceclark/Vessel)."
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.2.1/vessel-0.2.1-linux-arm64.tar.gz"
      sha256 "774c58604cfc57b55b2d4af1d1ac0f4216a97d7fc7caf4fe37715a8050b4644d"
    else
      url "https://github.com/spenceclark/Vessel/releases/download/v0.2.1/vessel-0.2.1-linux-x64.tar.gz"
      sha256 "b0f660ad12cb571547a437631d99c9d6b087e65ba1266361bc6dc3070d0505e1"
    end
  end

  def install
    bin.install "vessel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vessel --version")
  end
end
