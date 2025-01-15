# ~/.config/nix/flake.nix

{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
        url = "github:LnL7/nix-darwin";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util.url = "github:hraban/mac-app-util";

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nix-darwin, nixpkgs, mac-app-util, home-manager }:
  {
    # Nix-Darwin Config
    darwinConfigurations."charon" = nix-darwin.lib.darwinSystem {
      modules = [
        # Load Darwin configuration file
        ./darwin.nix

        # Enable Mac App Util
        mac-app-util.darwinModules.default
        
        # Enable Home Manager
        home-manager.darwinModules.home-manager {
          # Default Settings
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.verbose = true;

          # Load Home Manager configuration file
          home-manager.users.will = import ../home.nix;
        }
      ];
    };
  };
}