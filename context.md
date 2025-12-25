# Homebrew Tap Context

## Project Identity

**Name**: Beltic Homebrew Tap  
**Purpose**: Homebrew formula repository for distributing the Beltic CLI via Homebrew package manager. Provides easy installation for macOS users.  
**Core Value**: Simple, reliable CLI distribution via Homebrew.  
**Mechanism**:
- Formula Definition: Ruby formula that downloads binaries from GitHub Releases
- Multi-Architecture: Supports macOS Intel and Apple Silicon
- Version Management: Tracks CLI releases and updates formula accordingly

## Quick Commands

```bash
# Install Beltic CLI via Homebrew
brew install belticlabs/tap/beltic

# Update formula
brew update

# Test formula locally
brew install --build-from-source Formula/beltic.rb

# Check formula syntax
brew audit --strict Formula/beltic.rb

# Test formula
brew test beltic
```

## Stack

- **Package Manager**: Homebrew
- **Formula Language**: Ruby
- **Distribution**: GitHub Releases (beltic-cli repository)
- **Platforms**: macOS (Intel and Apple Silicon)

## Project Structure

```
homebrew-tap/
├── Formula/
│   └── beltic.rb          # Homebrew formula for Beltic CLI
└── README.md              # Installation instructions
```

## Commands

### Installation

```bash
# Tap the repository
brew tap belticlabs/tap

# Install Beltic CLI
brew install beltic

# Or install in one command
brew install belticlabs/tap/beltic
```

### Maintenance

```bash
# Update formula
brew update

# Upgrade Beltic CLI
brew upgrade beltic

# Uninstall
brew uninstall beltic

# Untap repository
brew untap belticlabs/tap
```

### Testing Formula

```bash
# Install from local formula
brew install --build-from-source Formula/beltic.rb

# Test formula
brew test beltic

# Audit formula
brew audit --strict Formula/beltic.rb

# Check for issues
brew doctor
```

## Testing

### Test Structure

- **Formula tests**: Use `test do` block in formula
- **Manual testing**: Install and verify CLI works

### Running Tests

```bash
# Test formula
brew test beltic

# Test with verbose output
brew test -v beltic
```

### Test Examples

```ruby
# Example from Formula/beltic.rb
test do
  system "#{bin}/beltic", "--version"
  system "#{bin}/beltic", "--help"
end
```

## Code Style

### Ruby Style

- Follow Homebrew style guide
- Use 2-space indentation
- Use descriptive variable names

### Formula Structure

```ruby
class Beltic < Formula
  desc "CLI for managing and signing verifiable credentials for AI agents"
  homepage "https://github.com/belticlabs/beltic-cli"
  url "https://github.com/belticlabs/beltic-cli/releases/download/v0.2.0/beltic-0.2.0.tar.gz"
  sha256 "..."

  def install
    bin.install "beltic"
  end

  test do
    system "#{bin}/beltic", "--version"
  end
end
```

## Git Workflow

### Commits

- Use conventional commits: `feat:`, `fix:`, `chore:`
- Keep commits focused on formula updates
- Write clear commit messages

```bash
# Good commit messages
git commit -m "chore: update beltic to v0.2.1"
git commit -m "fix: correct SHA256 hash for macOS arm64 binary"
```

### Releases

- Update formula when new CLI version is released
- Update `CHANGELOG.md` for each formula update
- Tag releases if needed

## Boundaries

### Never Commit

- **Personal credentials** or API keys
- **Test binaries** or artifacts
- **Temporary files**

### What This Repo Does

- ✅ Provides Homebrew formula for Beltic CLI
- ✅ Distributes CLI binaries via Homebrew
- ✅ Supports macOS (Intel and Apple Silicon)

### What This Repo Doesn't Do

- ❌ Build binaries (done in beltic-cli CI/CD)
- ❌ Host binaries (uses GitHub Releases)
- ❌ Provide Linux support (Homebrew on Linux is separate)

## Examples

### Updating Formula for New Version

```ruby
# Formula/beltic.rb
class Beltic < Formula
  desc "CLI for managing and signing verifiable credentials for AI agents"
  homepage "https://github.com/belticlabs/beltic-cli"
  
  # Update version and URL
  url "https://github.com/belticlabs/beltic-cli/releases/download/v0.2.1/beltic-0.2.1.tar.gz"
  sha256 "new_sha256_hash_here"
  
  # Update version method if needed
  version "0.2.1"
  
  def install
    bin.install "beltic"
  end
  
  test do
    system "#{bin}/beltic", "--version"
  end
end
```

### Adding Architecture Support

```ruby
# Formula/beltic.rb
if Hardware::CPU.intel?
  url "https://github.com/belticlabs/beltic-cli/releases/download/v0.2.0/beltic-darwin-amd64.tar.gz"
  sha256 "sha256_for_intel"
elsif Hardware::CPU.arm?
  url "https://github.com/belticlabs/beltic-cli/releases/download/v0.2.0/beltic-darwin-arm64.tar.gz"
  sha256 "sha256_for_arm64"
end
```

### Testing Formula Locally

```bash
# Install from local formula
brew install --build-from-source Formula/beltic.rb

# Verify installation
which beltic
beltic --version

# Test functionality
beltic --help
beltic init --help
```

## Common Workflows

### Updating Formula for New Release

1. Check beltic-cli repository for new release
2. Download release assets to get SHA256 hashes
3. Update `Formula/beltic.rb`:
   - Update `url` with new version
   - Update `sha256` hash
   - Update `version` if needed
4. Test locally: `brew install --build-from-source Formula/beltic.rb`
5. Commit: `git commit -m "chore: update beltic to v0.2.1"`
6. Push to repository

### Getting SHA256 Hash

```bash
# Download release asset
curl -L -o beltic.tar.gz https://github.com/belticlabs/beltic-cli/releases/download/v0.2.0/beltic-darwin-amd64.tar.gz

# Calculate SHA256
shasum -a 256 beltic.tar.gz
```

### Formula Validation

```bash
# Check syntax
brew audit --strict Formula/beltic.rb

# Check for common issues
brew audit --new Formula/beltic.rb

# Test installation
brew install --build-from-source Formula/beltic.rb
```

