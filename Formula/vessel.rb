class Vessel < Formula
  desc "Lightweight, local-first observability proxy for LLM traffic"
  homepage "https://github.com/spenceclark/Vessel"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.3.0/vessel-0.3.0-osx-arm64.tar.gz"
      sha256 "219400b24533b3193ea69358ff225b237c5f84d75a22506c1b99222d3838eea7"
    else
      odie "vessel: Intel Macs aren't published by this tap; build from source (https://github.com/spenceclark/Vessel)."
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spenceclark/Vessel/releases/download/v0.3.0/vessel-0.3.0-linux-arm64.tar.gz"
      sha256 "6d86802f46e9851eba3b0d1eef2b3181fabcced2126c9cb0da94542647a9ba05"
    else
      url "https://github.com/spenceclark/Vessel/releases/download/v0.3.0/vessel-0.3.0-linux-x64.tar.gz"
      sha256 "b94f3d291168b92c7a8ed87f69278833d8236ccd651866acd34de041c06da1b5"
    end
  end

  def install
    bin.install "vessel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vessel --version")
  end
end
