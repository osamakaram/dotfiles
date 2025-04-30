{
  description = "My Darwin Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils-plus.url = "github:gytis-ivaskevicius/flake-utils-plus";
    nix-update.url = "github:Mic92/nix-update";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager, flake-utils-plus, nix-update, flake-parts }:
  let
    # Import modules
    darwinSystem = nix-darwin.lib.darwinSystem;
    hostname = "macbookair"; # Can be parameterized or pulled from env vars
    username = "osama"; # Can be parameterized or pulled from env vars
    system = "aarch64-darwin";
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#hostname
    darwinConfigurations.${hostname} = darwinSystem {
      modules = [
        # Core system configuration
        ./modules/darwin.nix
        
        # Package management
        ./modules/packages.nix
        
        # Homebrew integration
        nix-homebrew.darwinModules.nix-homebrew
        ./modules/homebrew.nix
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = username;
            autoMigrate = true;
          };
        }
        
        # Mac App Store integration
        ./modules/mas.nix
        
        # Home Manager integration (user-specific settings)
        ./modules/home.nix
        
        # System-specific configuration
        {
          # Set hostname
          networking.hostName = hostname;
          
          # Set the platform
          nixpkgs.hostPlatform = "aarch64-darwin";
          
          # Disable nix-darwin's Nix management to avoid conflicts with Determinate Nix
          nix.enable = true;
          
          # Disable management of shell profiles to avoid conflicts
          environment.etc.bashrc.enable = true;
          environment.etc.zshrc.enable = true;
          environment.etc."bash.bashrc".enable = true;
          environment.etc."zsh/zshrc".enable = true;
          
          # Don't check files that would be overwritten
          system.activationScripts.extraActivation.enable = true;
        }
      ];
      specialArgs = {
        inherit inputs self username;
      };
    };

    # Expose tools and packages
    tools = {
      nix-update = inputs.nix-update;
      flake-utils-plus = inputs.flake-utils-plus;
      flake-parts = inputs.flake-parts;
      home-manager = inputs.home-manager;
    };
    
    # Expose the package set, including overlays, for convenience
    darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
    defaultPackage.${system} = self.darwinConfigurations.${hostname}.system;
    
    # Expose darwin-rebuild command
    apps.${system}.darwin-rebuild = {
      type = "app";
      program = "${nix-darwin.packages.${system}.darwin-rebuild}/bin/darwin-rebuild";
    };
  };
}
