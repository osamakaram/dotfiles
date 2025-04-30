#!/usr/bin/env bash
set -euo pipefail

echo "» Bootstrapping environment…"

# 1) Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2) Install packages, casks, and apps via Brewfile
echo "Installing Homebrew dependencies from Brewfile..."
brew bundle --file "$(pwd)/Brewfile"

# 3) Install or update chezmoi
if ! command -v chezmoi >/dev/null 2>&1; then
  echo "chezmoi not found. Installing chezmoi..."
  brew install chezmoi
else
  echo "Updating chezmoi..."
  brew upgrade chezmoi || true
fi

# 4) Initialize and apply chezmoi configuration
echo "Initializing and applying chezmoi configuration..."
chezmoi init --apply "$(pwd)"

# 5) Apply macOS system defaults
if [ -x scripts/macos-defaults.sh ]; then
  echo "Applying macOS defaults..."
  scripts/macos-defaults.sh
else
  echo "macOS defaults script not found or not executable."
fi

echo "✅  Bootstrapping complete. Please restart your terminal or log out/in if necessary."