class Beltic < Formula
  desc "CLI for managing and signing verifiable credentials for AI agents"
  homepage "https://github.com/belticlabs/beltic-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v#{version}/beltic-aarch64-apple-darwin.tar.gz"
      sha256 "373ed589d9e753706091dac4f128a9e8668e2b472d61ec153dc7da674b8a3520"
    end
    on_intel do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v#{version}/beltic-x86_64-apple-darwin.tar.gz"
      sha256 "d6dac28b46d40453a44bdb8d57d8e7d2edf98434f8770537086272f70dff4089"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v#{version}/beltic-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d90fbe38df38e8252c9040f9129df4fb21623bb75fb2d16740cf77975d69915"
    end
    on_intel do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v#{version}/beltic-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c5d5c8a145d2cb3c549870175da54eea93fb74909d93fb9d7937a833ab04fde"
    end
  end

  def install
    bin.install "beltic"
  end

  test do
    assert_match "beltic", shell_output("#{bin}/beltic --version")
  end
end
