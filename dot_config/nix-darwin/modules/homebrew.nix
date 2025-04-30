# modules/homebrew.nix
# Configuration for Homebrew packages
{ config, pkgs, lib, ... }:

{
  # Homebrew configuration
  homebrew = {
    enable = true;
    
    # Configure Homebrew behavior on activation
    onActivation = {
      cleanup = "zap"; # Remove all unmanaged dependencies
      upgrade = false;
      autoUpdate = false;
    };
    
    # Global auto-update setting
    global.autoUpdate = false;
    
    # Homebrew formulae (CLI tools)
    brews = [
      # "bitwarden-cli" # Commented items are disabled but available for quick reactivation
      "git-delta"
      "homebrew-ffmpeg/ffmpeg/ffmpeg"
      "incus"
      "mas" # Required for Mac App Store integration
      "node"
      "ntfy"
      "nvm"
      "qt"
      "vault-radar"
    ];
    
    # Homebrew casks (GUI Applications)
    casks = [
      # Development Tools
      "cursor"
      "docker"
      "git-credential-manager"
      "github"
      "iterm2"
      "orbstack"
      "sourcetree"
      "vagrant"
      "vagrant-manager"
      "vagrant-vmware-utility"
      "virtualbox"
      
      # Media Applications
      "audacity"
      "deezer"
      "gimp"
      "handbrake"
      "iina"
      "inkscape"
      "jellyfin-media-player"
      "kodi"
      "krita"
      "macwhisper"
      "obs"
      "plex"
      "spotify"
      "yattee"
      
      # Productivity
      "alfred"
      "alt-tab"
      "browserosaurus"
      "discord"
      "espanso"
      "finicky"
      "maccy"
      "marta"
      "meetingbar"
      "messenger"
      "microsoft-teams"
      "notion"
      "skype"
      "slack"
      "ssh-config-editor"
      "whatsapp"
      "zoom"
      
      # System Utilities
      "balenaetcher"
      "bartender"
      "daisydisk"
      "dangerzone"
      "go64"
      "keycastr"
      "lulu"
      "lunasea"
      "pearcleaner"
      "raspberry-pi-imager"
      "sf-symbols"
      "sloth"
      "spacedrive"
      "tor-browser"
      "transmission"
      "upscayl"
      "utm"
      
      # Creative & 3D
      "blender"
      "darktable"
      "freecad"
      "godot"
      
      # Gaming
      "minecraft"
      "steam"
      
      # Fonts
      "font-code-new-roman-nerd-font"
      "font-comic-shanns-mono-nerd-font"
      "font-fira-code-nerd-font"
      "font-fira-code"
      "font-geist-mono-nerd-font"
      "font-hack-nerd-font"
      "font-jetbrains-mono"
      "font-meslo-lg-nerd-font"
      "font-symbols-only-nerd-font"
      
      # Special Applications
      "hashicorp-boundary-desktop"
      "mactex"
    ];
    
    # Homebrew taps (repositories)
    taps = [
      "dotenvx/brew"
      # "esolitos/ipa"
      "espanso/espanso"
      "felixkratz/formulae"
      "hashicorp/tap"
      "homebrew-ffmpeg/ffmpeg"
      # "marsanne/cask"
      "microsoft/git"
      # "minio/stable"
      # "netdcy/flowvision"
      "olets/tap"
      # "pablopunk/brew"
      "ptsochantaris/tap"
    ];
  };
} 