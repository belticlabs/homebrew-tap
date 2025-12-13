class Beltic < Formula
  desc "CLI for managing and signing verifiable credentials for AI agents"
  homepage "https://github.com/belticlabs/beltic-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v0.2.0/beltic-aarch64-apple-darwin.tar.gz"
      sha256 "85679eede5a78fb3f6dd3912511bf7c5a5335dbadf2bfb92e4cbcd5039c13005"
    end
    on_intel do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v0.2.0/beltic-x86_64-apple-darwin.tar.gz"
      sha256 "093826ddba9096f88c019781111711ff55ccf26afc5a7832fe45a218503b72e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v0.2.0/beltic-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "833d021087ca55a6463eb78cf106f687ecea3e3881e35f690206de5874435831"
    end
    on_intel do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v0.2.0/beltic-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "339f3923831af2faff49fe683cfdb74c1d83a479b0ccac739e0ac87fa4ae4895"
    end
  end

  def install
    bin.install "beltic"
  end

  test do
    assert_match "beltic", shell_output("#{bin}/beltic --version")
  end
end
