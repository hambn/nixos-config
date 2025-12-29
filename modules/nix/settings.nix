{ ... }: {
  # ==========================================================================
  # Nix Package Manager Settings
  # These options control how Nix behaves system-wide
  # Config file: /etc/nix/nix.conf
  # ==========================================================================

  nix.settings = {
    # ------------------------------------------------------------------------
    # Core Features
    # ------------------------------------------------------------------------

    # Enable flakes and new nix commands (nix build, nix shell, etc.)
    experimental-features = [ "nix-command" "flakes" ];

    # Optimize store by hard-linking identical files during builds
    auto-optimise-store = true;

    # ------------------------------------------------------------------------
    # Build Settings
    # ------------------------------------------------------------------------

    # Max parallel build jobs ("auto" = number of CPU cores)
    max-jobs = "auto";

    # CPU cores per build job (0 = all available cores)
    cores = 0;

    # Build in sandbox (isolate builds from system)
    # Prevents undeclared dependencies, ensures reproducibility
    sandbox = true;

    # Extra paths available inside sandbox
    # sandbox-paths = [ "/bin/sh=${pkgs.bash}/bin/sh" ];

    # Fall back to building from source if binary cache fails
    fallback = true;

    # Keep build logs for debugging
    # keep-build-log = true;

    # Lines of build log to show on failure
    # log-lines = 25;

    # ------------------------------------------------------------------------
    # Users & Permissions
    # ------------------------------------------------------------------------

    # Users allowed to connect to Nix daemon
    allowed-users = [ "@wheel" ];

    # Users with full Nix daemon access (can add substituters, etc.)
    trusted-users = [ "root" "@wheel" ];

    # ------------------------------------------------------------------------
    # Binary Caches (Substituters)
    # ------------------------------------------------------------------------

    # Where to fetch pre-built packages from
    substituters = [
      "https://cache.nixos.org"
      # "https://nix-community.cachix.org"     # Community cache
      # "https://hyprland.cachix.org"          # Hyprland cache
    ];

    # Public keys to verify binary cache signatures
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      # "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      # "hyprland.cachix.org-1:a7pgxzMz7+ voices=RyGlR6drbnr5aXYZHLM/EzT8oCw="
    ];

    # Use substitutes on remote builders (fetch deps from cache, not local)
    # builders-use-substitutes = true;

    # ------------------------------------------------------------------------
    # Network Settings
    # ------------------------------------------------------------------------

    # Timeout for connecting to caches (seconds, 0 = 300s default)
    connect-timeout = 5;

    # Timeout for stalled downloads (seconds)
    # stalled-download-timeout = 25;

    # Max parallel downloads
    # http-connections = 50;

    # Download buffer size in bytes (default 64MB)
    # Increase if you get "download buffer full" warnings
    # download-buffer-size = 134217728;  # 128MB

    # ------------------------------------------------------------------------
    # Store & Garbage Collection
    # ------------------------------------------------------------------------

    # Minimum free disk space before GC triggers (bytes)
    # min-free = 1073741824;  # 1GB

    # Target free space after auto-GC (bytes)
    # max-free = 5368709120;  # 5GB

    # Keep outputs of derivations (prevents GC of build results)
    keep-outputs = true;

    # Keep .drv files (useful for debugging and traceability)
    keep-derivations = true;

    # How long to cache negative narinfo lookups (seconds)
    # narinfo-cache-negative-ttl = 0;

    # ------------------------------------------------------------------------
    # UI & Logging
    # ------------------------------------------------------------------------

    # Warn about uncommitted Git changes in flakes
    warn-dirty = false;

    # Show more detailed build output
    # show-trace = true;

    # Use XDG directories (~/.local/state/nix instead of ~/.nix-*)
    # WARNING: Requires manual migration of existing files
    # use-xdg-base-directories = true;
  };

  # ==========================================================================
  # Extra Options (appended to nix.conf)
  # For options not yet in nix.settings
  # ==========================================================================

  # nix.extraOptions = ''
  #   !include /etc/nix/extra.conf
  # '';

  # ==========================================================================
  # Nixpkgs Configuration
  # Controls how packages are selected and built
  # ==========================================================================

  nixpkgs.config = {
    # Allow proprietary/closed-source packages
    allowUnfree = true;

    # Allow specific unfree packages only
    # allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    #   "vscode"
    #   "google-chrome"
    # ];

    # Allow packages with known security issues
    # WARNING: Only use if you understand the risks
    # permittedInsecurePackages = [
    #   "openssl-1.1.1w"
    # ];

    # Allow broken packages (usually fails to build)
    # allowBroken = false;

    # Allow packages with unsupported system
    # allowUnsupportedSystem = false;
  };

  # ==========================================================================
  # Overlays
  # Modify or extend nixpkgs
  # ==========================================================================

  # nixpkgs.overlays = [
  #   # Add custom packages
  #   (final: prev: {
  #     myPackage = prev.callPackage ./pkgs/my-package { };
  #   })
  #
  #   # Override existing package
  #   (final: prev: {
  #     htop = prev.htop.override { sensorsSupport = false; };
  #   })
  # ];
}
