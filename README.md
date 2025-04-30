# 🏠 Dotfiles

A minimal, secure dotfiles management system using [chezmoi](https://www.chezmoi.io/).

## 🚀 Overview

This repository contains my personal dotfiles for macOS, managed with chezmoi. It's designed to be:

- **Minimal**: Only essential configuration files, no large caches or binaries
- **Secure**: Sensitive files are properly encrypted
- **Reproducible**: Easy to set up on a new machine
- **Automated**: CI/CD pipeline for security scanning and updates

## ⚙️ What's Included

- Shell configuration (Zsh)
- Git configuration
- Editor settings
- Application configurations (iTerm2, etc.)
- Templates for common configuration files
- Automated security scanning
- Configuration testing

## ⛔ What's Excluded

To keep this repository lean, the following are excluded:

1. **Cache Files**: npm, gem, Yarn caches
2. **Large Binaries**: SWT libraries, kubectl binaries
3. **Temporary Files**: Logs, lockfiles
4. **Regeneratable Content**: TLDR pages, Vagrant boxes
5. **State Files**: Application state, history databases
6. **Database Files**: SQLite databases

## 🛠️ Setup

### Prerequisites

- Git
- [chezmoi](https://www.chezmoi.io/install/)

### Installation

```bash
# Install chezmoi and apply dotfiles
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/USERNAME/dotfiles.git
```

### One-Line Bootstrap

You can bootstrap your entire environment (Homebrew, dependencies, dotfiles, and macOS defaults) in one go:

```bash
git clone https://github.com/USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

This script will:

- Install Homebrew if it’s not already present
- Install all formulas, casks, and Mac App Store apps via Brewfile
- Install or update and apply your chezmoi configuration
- Apply macOS system defaults (dock, Finder, global settings)
 
You can also use the included Makefile to run common tasks:

```bash
make install   # bootstrap everything
make defaults  # re-apply macOS defaults only
make apply     # apply chezmoi configuration
make sync      # brew bundle; chezmoi update && chezmoi apply
make check     # run syntax & config validation
```

## 🔄 Usage

### Working with Files

```bash
# Add a file to chezmoi
chezmoi add ~/.zshrc

# Edit a file
chezmoi edit ~/.zshrc

# Preview changes before applying
chezmoi diff

# Apply changes to your home directory
chezmoi apply
```

### Syncing Changes

Chezmoi manages files in three locations:

1. **Home directory** (~/): Where you use the files
2. **Source directory** (~/.local/share/chezmoi): Local repository
3. **Remote repository**: GitHub backup

#### Home → Source → Remote (Making Changes)

When you modify files in your home directory:

```bash
# Add changes to source directory
chezmoi add ~/.zshrc

# To automatically commit and push changes
# The chezmoi.yaml.templ already includes:
# git:
#   autoCommit: true
#   autoPush: true

# Or manually:
chezmoi cd
git add .
git commit -m "Update zshrc"
git push
exit
```

#### Remote → Source → Home (Getting Updates)

When the remote repository has changes:

```bash
# Update source from remote and preview changes
chezmoi update --dry-run

# Apply the changes to your home directory
chezmoi update
```

#### Source → Home (Local Changes)

If you directly edit files in the source directory:

```bash
# Preview changes
chezmoi diff

# Apply changes
chezmoi apply
```

## 🔐 Security

- Sensitive files are prefixed with `private_` in the repository
- chezmoi automatically applies appropriate permissions
- Automated security scanning via GitHub Actions:
  - Gitleaks: Checks for hardcoded secrets using pattern matching
  - TruffleHog: Uses entropy analysis to detect potential secrets
- Custom security rules in `.gitleaks.toml` and `.trufflehog.yaml`

## 🤖 Automation

This repository uses GitHub Actions for several automated tasks:

1. **Security Scanning**: Detects secrets and sensitive information

   - Uses GitLeaks to check for hardcoded secrets using pattern matching
   - Uses TruffleHog for entropy analysis to detect potential secrets

2. **Linting**: Ensures code quality with Super-linter

   - Validates YAML, JSON, Markdown, Bash, and Zsh files
   - Uses caching to speed up the process

3. **Configuration Testing**: Validates chezmoi configuration

   - Performs a dry run of chezmoi initialization
   - Tests template rendering
   - Validates configuration structure

4. **Automated Updates**: Optionally updates machines on schedule

   - Can be configured to update remote machines via SSH
   - Runs a simulation before making any changes

5. **Notifications**: Creates GitHub issues for workflow failures
   - Automatically reports any issues in the pipeline
   - Includes links to failed workflows for easier debugging

The automation pipeline runs:

- On every push to main
- On pull requests
- Daily at 7:00 AM UTC
- Manually when triggered via the GitHub Actions UI

All workflows are defined in the `.github/workflows/update.yaml` file.

## 🧑‍💻 Major Configurations

### Shell (Zsh)

- Modern prompt with [starship](https://starship.rs/)
- Useful aliases and functions
- Integration with development tools

### Git

- User information and preferences
- Useful aliases
- Global ignore patterns

### Templates

The `dot_templates` directory contains template files that can be used as a starting point for new projects.

## 📋 Maintenance

The `.chezmoiignore` file contains patterns that exclude unnecessary files from being managed by chezmoi. This helps keep the repository clean and focused on essential configuration.
