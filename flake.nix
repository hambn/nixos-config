{
  description = "hambn NixOS flake config";

  # =============================================================================
  # INPUTS - External dependencies and package sources
  # =============================================================================
  inputs = {
    # Main package repositories
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    # Chaotic-AUR packages for NixOS
    chaotic.url = "github:chaotic-cx/nyx";

    # Home Manager - Declarative user environment management
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland - Dynamic tiling Wayland compositor
    hyprland = {
      url = "github:hyprwm/Hyprland/v0.52.2?submodules=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprlock - Screen locker for Hyprland
    hyprlock = {
      url = "github:hyprwm/hyprlock/v0.9.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plasma Manager - KDE Plasma configuration management
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Stylix - System-wide theming
    stylix.url = "github:nix-community/stylix";

    # Emacs overlay - Bleeding edge Emacs packages
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Rust overlay - Latest Rust toolchains
    rust-overlay.url = "github:oxalica/rust-overlay";

    # StevenBlack's unified hosts file for ad/malware blocking
    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;  # Not a flake, just raw data
    };
  };


  # =============================================================================
  # OUTPUTS - System configurations and helper functions
  # =============================================================================
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;

      # ---------------------------------------------------------------------------
      # HELPER FUNCTIONS - Automatic discovery of modules, hosts, and users
      # ---------------------------------------------------------------------------

      # Recursively find all .nix files in a directory
      # Returns a flattened list of paths to all .nix files
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

      # Find immediate subdirectories only (not recursive)
      # Returns a list of directory names
      findUserDirs = dir:
        if builtins.pathExists dir
        then lib.attrNames (lib.filterAttrs (n: v: v == "directory") (builtins.readDir dir))
        else [];

      # ---------------------------------------------------------------------------
      # DISCOVERY - Automatically find hosts, modules, and users
      # ---------------------------------------------------------------------------

      # All hosts (from ./hosts directory)
      hosts = findUserDirs ./hosts;

      # Global modules (from ./modules directory) - auto-imported for all hosts
      globalModules = findNixFiles ./modules;

      # Global users (from ./users directory) - available to all hosts
      globalUsers = findUserDirs ./users;

      # Get host-specific modules (from ./hosts/HOST/modules directory)
      getHostModules = host: findNixFiles ./hosts/${host}/modules;

      # Get host-specific users (from ./hosts/HOST/users directory)
      getHostUsers = host: findUserDirs ./hosts/${host}/users;

      # ---------------------------------------------------------------------------
      # CONFIGURATION BUILDERS
      # ---------------------------------------------------------------------------

      # Build Home Manager user configurations for a specific host
      # Combines global users and host-specific users
      # Prefers host-specific home.nix over global home.nix if both exist
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

      # Build a complete NixOS system configuration for a host
      # Automatically imports:
      # - Host-specific configuration (./hosts/HOST)
      # - Home Manager module with user configurations
      # - All global modules (./modules/**)
      # - Host-specific modules (./hosts/HOST/modules/**)
      mkHost = host: lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs host; };  # Make inputs and hostname available to all modules
        modules = [
          ./hosts/${host}                              # Host-specific configuration
          inputs.home-manager.nixosModules.home-manager  # Home Manager integration
          {
            home-manager = {
              useGlobalPkgs = true;      # Use system-level nixpkgs
              useUserPackages = true;    # Install packages to user profile
              extraSpecialArgs = { inherit inputs host; };  # Pass inputs to home-manager modules
              users = mkHomeUsers host;  # User configurations
            };
          }
        ] ++ globalModules ++ (getHostModules host);  # Add all discovered modules
      };

    # ---------------------------------------------------------------------------
    # FINAL OUTPUT - NixOS system configurations
    # ---------------------------------------------------------------------------
    in {
      # Generate NixOS configurations for all discovered hosts
      # Usage: nixos-rebuild switch --flake .#HOSTNAME
      nixosConfigurations = builtins.listToAttrs (map (host: {
        name = host;
        value = mkHost host;
      }) hosts);
    };
}
