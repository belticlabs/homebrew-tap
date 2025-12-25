# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## Philosophy & Guidelines

### Core Philosophy
- **Accuracy First**: Never guess SHA256 hashes or URLs. Always verify from GitHub Releases. When in doubt, ask.
- **Incremental Progress**: Test formula changes incrementally.
- **Clear Intent**: Formula should be clear and maintainable.
- **Multi-Platform**: Support macOS Intel and Apple Silicon, Linux if applicable.

### Eight Honors and Eight Shames
- Shame in guessing APIs, Honor in careful research.
- Shame in vague execution, Honor in seeking confirmation.
- Shame in assuming business logic, Honor in human verification.
- Shame in creating interfaces, Honor in reusing existing ones.
- Shame in skipping validation, Honor in proactive testing.
- Shame in breaking architecture, Honor in following specifications.
- Shame in pretending to understand, Honor in honest ignorance.
- Shame in blind modification, Honor in careful refactoring.

### Quality Standards
- **Homebrew Style**: Follow Homebrew formula style guide.
- **Ruby Formatting**: Use standard Ruby formatting.
- **Validation**: Always test formula before committing.
- **CHANGELOG Updates**: Always update CHANGELOG.md when updating formula or making significant changes.

## Project Identity

**Name**: Beltic Homebrew Tap  
**Purpose**: Homebrew formula repository for distributing the Beltic CLI via Homebrew.  
**Core Value**: Simple, reliable CLI distribution via Homebrew.

## Technology Stack

- **Package Manager**: Homebrew
- **Formula Language**: Ruby
- **Distribution**: GitHub Releases (beltic-cli repository)
- **Platforms**: macOS (Intel and Apple Silicon), Linux

## Repository Architecture

```
homebrew-tap/
├── Formula/
│   └── beltic.rb          # Homebrew formula for Beltic CLI
└── README.md              # Installation instructions
```

## Key Workflows

### Development
1. **Understand**: Read existing formula to understand structure
2. **Update**: Modify formula for new version
3. **Verify**: Test locally with `brew install --build-from-source`
4. **Update**: Always update CHANGELOG.md for formula updates

### Commands
```bash
# Install Beltic CLI
brew install belticlabs/tap/beltic

# Test formula locally
brew install --build-from-source Formula/beltic.rb

# Audit formula
brew audit --strict Formula/beltic.rb

# Test formula
brew test beltic
```

## Common AI Tasks

### Updating Formula for New Release
1. Check beltic-cli repository for new release version (e.g., v0.2.1)
2. Download release assets: `curl -L -o beltic.tar.gz https://github.com/belticlabs/beltic-cli/releases/download/v0.2.1/beltic-darwin-amd64.tar.gz`
3. Calculate SHA256: `shasum -a 256 beltic.tar.gz`
4. Update `Formula/beltic.rb`:
   - Update `version` string
   - Update `url` with new version
   - Update `sha256` hashes for each platform
5. Test locally: `brew install --build-from-source Formula/beltic.rb`
6. Verify: `beltic --version`
7. **Update CHANGELOG.md** under Changed section

### Adding Linux Support
1. Add `on_linux` block to formula (if not present)
2. Add URLs and SHA256 hashes for Linux binaries
3. Test if possible
4. **Update CHANGELOG.md** under Added section

### Fixing a Bug
1. Reproduce issue
2. Fix formula (URL, hash, or installation logic)
3. Test: `brew install --build-from-source Formula/beltic.rb`
4. **Update CHANGELOG.md** under Fixed section

## Git Workflow

### Commits
- Use conventional commits: `chore:`, `fix:`
- Keep commits focused on formula updates
- **Always update CHANGELOG.md** for formula changes or significant updates

### Releases
- Update formula when new CLI version is released
- **Update CHANGELOG.md** for each formula update

## Boundaries

### Never Commit
- **Personal credentials** or API keys
- **Test binaries** or artifacts
- **Temporary files**

### Security Rules
1. **Verify SHA256 hashes**: Always download and verify hashes from GitHub Releases
2. **Test formula**: Always test locally before committing
3. **Validate syntax**: Use `brew audit` to check formula

