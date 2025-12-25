{
  description = "hambn NixOS flake config";

  inputs = {
  
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    chaotic.url = "github:chaotic-cx/nyx";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland = {
      url = "github:hyprwm/Hyprland/v0.52.2?submodules=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock/v0.9.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    stylix.url = "github:nix-community/stylix";

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay.url = "github:oxalica/rust-overlay";

    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };

  };


  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;

      # recursively find all .nix files in a directory
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

      # find user directories (immediate subdirs only)
      findUserDirs = dir:
        if builtins.pathExists dir
        then lib.attrNames (lib.filterAttrs (n: v: v == "directory") (builtins.readDir dir))
        else [];

      # get all hosts
      hosts = findUserDirs ./hosts;

      # global modules
      globalModules = findNixFiles ./modules;

      # global users
      globalUsers = findUserDirs ./users;

      # host-specific modules
      getHostModules = host: findNixFiles ./hosts/${host}/modules;

      # host-specific users
      getHostUsers = host: findUserDirs ./hosts/${host}/users;

      # build home-manager users attr
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

      mkHost = host: lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs host; };
        modules = [
          ./hosts/${host}
          inputs.home-manager.nixosModules.home-manager
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

    in {
      nixosConfigurations = builtins.listToAttrs (map (host: {
        name = host;
        value = mkHost host;
      }) hosts);
    };      
}
