{ inputs, ... }: {
  # ==========================================================================
  # Nix Flake Registry
  # Map short names to flake URLs (e.g., `nix shell nixpkgs#htop`)
  # View registry: nix registry list
  # ==========================================================================

  nix.registry = {
    # Pin nixpkgs to the same version used in this flake
    # Makes `nix shell nixpkgs#package` use the same nixpkgs as your system
    nixpkgs.flake = inputs.nixpkgs;

    # Add shortcut for this flake itself
    # Usage: nix build self#nixosConfigurations.bn-laptop
    # self.flake = inputs.self;
  };

  # ==========================================================================
  # NIX_PATH (for legacy nix-shell, nix-env, etc.)
  # Keeps compatibility with non-flake commands
  # ==========================================================================

  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs}"
    # "nixos-config=/etc/nixos/configuration.nix"  # Legacy location
  ];

  # ==========================================================================
  # Flake Registry Settings
  # ==========================================================================

  nix.settings = {
    # Use the global flake registry from GitHub
    # Set to false to only use local/system registry
    # use-registries = true;

    # Accept flake configs without prompting (trusted flakes only)
    # accept-flake-config = false;
  };

  # ==========================================================================
  # Disable Channels (not needed with flakes)
  # Channels are the old way of managing nixpkgs versions
  # ==========================================================================

  nix.channel.enable = false;
}
