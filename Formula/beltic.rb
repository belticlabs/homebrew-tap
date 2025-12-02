class Beltic < Formula
  desc "CLI for managing and signing verifiable credentials for AI agents"
  homepage "https://github.com/belticlabs/beltic-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v0.1.1/beltic-aarch64-apple-darwin.tar.gz"
      sha256 "daf99ab76bc97df6c7e87b05cbd5ac4867efc6e20217ef70371b284861d8b78c"
    end
    on_intel do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v0.1.1/beltic-x86_64-apple-darwin.tar.gz"
      sha256 "29dee5b9c726c69ef3e5c642454e6ca7bf6cde0669152aca4d386cee3f07f3fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v0.1.1/beltic-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4e797becd45cacd9618e418c2811a2a65d5398a0d24a2363d5b1c9c4f665ad8"
    end
    on_intel do
      url "https://github.com/belticlabs/beltic-cli/releases/download/v0.1.1/beltic-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "300cd294621d163bb214a1b19e2de65ca981606d2d3ff22359c166b92c01b230"
    end
  end

  def install
    bin.install "beltic"
  end

  test do
    assert_match "beltic", shell_output("#{bin}/beltic --version")
  end
end
