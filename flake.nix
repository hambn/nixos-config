{
  description = "hambn NixOS flake config";

  # ==========================================================================
  # INPUTS
  # External dependencies fetched by Nix
  # ==========================================================================
  inputs = {
    # NixOS packages (unstable channel)
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager - manage user dotfiles and packages
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix-flatpak - declarative Flatpak packages
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # Hyprland - tiling Wayland compositor (for later use)
    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprlock - screen locker for Hyprland (for later use)
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  # ==========================================================================
  # OUTPUTS
  # System configurations built from inputs
  # ==========================================================================
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;

      # ------------------------------------------------------------------------
      # Helper functions for auto-discovery
      # ------------------------------------------------------------------------

      # Find all .nix files in a directory (recursive)
      findNixFiles = dir:
        let
          entries = builtins.readDir dir;
          process = name: type:
            let path = dir + "/${name}";
            in if type == "directory" then findNixFiles path
               else if lib.hasSuffix ".nix" name then [ path ]
               else [];
        in if builtins.pathExists dir
           then lib.flatten (lib.mapAttrsToList process entries)
           else [];

      # Find subdirectories (not recursive)
      findUserDirs = dir:
        if builtins.pathExists dir
        then lib.attrNames (lib.filterAttrs (n: v: v == "directory") (builtins.readDir dir))
        else [];

      # ------------------------------------------------------------------------
      # Auto-discovery paths
      # ------------------------------------------------------------------------

      hosts = findUserDirs ./hosts;                              # All hosts
      globalModules = findNixFiles ./modules;                    # Shared modules
      globalUsers = findUserDirs ./users;                        # Shared users
      getHostModules = host: findNixFiles ./hosts/${host}/modules;  # Host-only modules
      getHostUsers = host: findUserDirs ./hosts/${host}/users;      # Host-only users

      # ------------------------------------------------------------------------
      # Configuration builders
      # ------------------------------------------------------------------------

      # Build Home Manager users (host-specific overrides global)
      mkHomeUsers = host:
        let
          allUsers = globalUsers ++ (getHostUsers host);
          mkUser = user:
            let
              globalPath = ./users/${user}/home.nix;
              hostPath = ./hosts/${host}/users/${user}/home.nix;
            in {
              name = user;
              value =
                if builtins.pathExists hostPath then import hostPath
                else import globalPath;
            };
        in builtins.listToAttrs (map mkUser allUsers);

      # Build NixOS system for a host
      mkHost = host: lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs host; };
        modules = [
          ./hosts/${host}
          inputs.home-manager.nixosModules.home-manager
          inputs.nix-flatpak.nixosModules.nix-flatpak
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs host; };
              users = mkHomeUsers host;
            };
          }
        ] ++ globalModules ++ (getHostModules host);
      };

    # --------------------------------------------------------------------------
    # Final output
    # --------------------------------------------------------------------------
    in {
      # Usage: sudo nixos-rebuild switch --flake .#HOSTNAME
      nixosConfigurations = builtins.listToAttrs (map (host: {
        name = host;
        value = mkHost host;
      }) hosts);
    };
}
