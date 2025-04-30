# modules/darwin.nix
# Core system configuration for macOS
{ config, pkgs, lib, inputs, self, username, ... }:

{
  # Fix for nixbld group GID mismatch
  ids.gids.nixbld = 350;

  # System-wide settings
  networking = {
    computerName = "Osama's MacBook Air"; # Consider making this configurable
    dns = [ "1.1.1.1" "1.0.0.1" ];
    knownNetworkServices = [
      "USB 10/100/1000 LAN"
      "Wi-Fi"
      "UniFi Teleport"
      "VPN Unlimited"
    ];
  };

  # System defaults
  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      expose-animation-duration = 0.0;
      mineffect = "scale";
      minimize-to-application = true;
      orientation = "left";
      show-recents = false;
      showhidden = true;
      wvous-bl-corner = 1;
      wvous-br-corner = 4;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      persistent-apps = [
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
      ];
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      FXPreferredViewStyle = "Nlsv";
      NewWindowTarget = "Home";
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowPathbar = true;
      ShowRemovableMediaOnDesktop = false;
      ShowStatusBar = true;
      _FXSortFoldersFirst = true;
      _FXSortFoldersFirstOnDesktop = true;
    };
    loginwindow.GuestEnabled = false;
    menuExtraClock = {
      ShowAMPM = true;
      ShowDate = 0;
      ShowDayOfMonth = true;
      ShowDayOfWeek = true;
    };
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
    };
  };

  # Auto upgrade nix package and the daemon service
  # services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Necessary for using flakes on this system
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility
  system.stateVersion = 5;

  # Nix garbage collection and optimization
  # Disabled due to incompatibility with Determinate Nix
  # nix.gc.automatic = true;
  # nix.optimise.automatic = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable useful programs
  programs.direnv.enable = true;
  programs.nix-index.enable = true;

  # Enable TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # System activation scripts
  system.activationScripts = {
    applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
      pkgs.lib.mkForce ''
        # Set up applications
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
      '';
      
    # Add custom activation scripts here
    installMcpServers.text = ''
      ${pkgs.python312}/bin/pip install --break-system-packages mcp-server-fetch
    '';
  };
} 