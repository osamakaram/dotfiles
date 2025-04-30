#!/usr/bin/env bash
set -e

echo "» Applying macOS defaults…"

# 1) Dock settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock wvous-bl-corner -int 1
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-tl-corner -int 1
defaults write com.apple.dock wvous-tr-corner -int 1

if command -v dockutil >/dev/null 2>&1; then
  dockutil --remove all --no-restart
  apps=(
    "/System/Applications/Launchpad.app"
    "/Applications/LaunchPadder.app"
    "/Applications/Perplexity.app"
    "/Applications/16x Prompt.app"
    "/Applications/ChatGPT.app"
    "/Applications/Claude.app"
    "/Applications/iTerm.app"
    "/Applications/Cursor.app"
    "/Applications/GitButler.app"
    "/Applications/DEVONthink.app"
    "/Applications/Elephas.app"
    "/Applications/Notion.app"
    "/Applications/Safari.app"
    "/Applications/Zen.app"
    "/Applications/VMware Fusion.app"
    "/System/Applications/FaceTime.app"
    "/Applications/Discord.app"
    "/Applications/Messenger.app"
    "/System/Applications/Messages.app"
    "/Applications/WhatsApp.app"
    "/System/Applications/Mail.app"
    "/Applications/Home Assistant.app"
    "/Applications/Plex.app"
    "/System/Applications/iPhone Mirroring.app"
    "/System/Applications/Calendar.app"
    "/System/Applications/Music.app"
    "/System/Applications/Photos.app"
    "/System/Applications/App Store.app"
    "/System/Applications/System Settings.app"
  )
  for app in "${apps[@]}"; do
    dockutil --add "$app" --no-restart
  done
else
  echo "⚠️  dockutil not found; skipping Dock persistent-apps"
fi
killall Dock || true

# 2) Finder settings
defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder CreateDesktop -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder NewWindowTarget -string "Home"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true
killall Finder || true

# 3) Menu bar clock
defaults write com.apple.menuextra.clock ShowAMPM -bool true
defaults write com.apple.menuextra.clock ShowDate -int 0
defaults write com.apple.menuextra.clock ShowDayOfMonth -bool true
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true

# 4) Global settings
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults write NSGlobalDomain KeyRepeat -int 2

# 5) Login window
defaults write com.apple.loginwindow GuestEnabled -bool false

echo "✅  macOS defaults applied."