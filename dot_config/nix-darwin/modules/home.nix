# modules/home.nix
# Home Manager configuration
{ config, pkgs, lib, username, inputs, ... }:

{
  # Import home-manager module
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  # Configure home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    # Define user configuration
    users.${username} = { pkgs, ... }: {
      # Home Manager configuration
      home = {
        # Required: Set the home directory to an absolute path
        # Use mkForce to override any null values from common.nix
        homeDirectory = lib.mkForce "/Users/${username}";
        
        # This value determines the Home Manager release that your
        # configuration is compatible with. This helps avoid breakage
        # when a new release introduces backwards incompatible changes.
        stateVersion = "23.11";
        
        # User-specific packages
        packages = with pkgs; [
          # Add user-specific packages here
        ];
      };
      
      # Environment variables and other configurations are commented out
      # for now but can be enabled as needed
    };
  };
}