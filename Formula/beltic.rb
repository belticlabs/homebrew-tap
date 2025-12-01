class Beltic < Formula
  desc "CLI for managing and signing verifiable credentials for AI agents"
  homepage "https://github.com/belticlabs/beltic-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v#{version}/beltic-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM64_DARWIN"
    end
    on_intel do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v#{version}/beltic-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X64_DARWIN"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v#{version}/beltic-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM64_LINUX"
    end
    on_intel do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v#{version}/beltic-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X64_LINUX"
    end
  end

  def install
    bin.install "beltic"
  end

  test do
    assert_match "beltic", shell_output("#{bin}/beltic --version")
  end
end

