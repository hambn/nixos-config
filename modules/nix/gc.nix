{ ... }: {
  # ==========================================================================
  # Nix Garbage Collection
  # Automatically clean up old packages and generations
  # Manual: sudo nix-collect-garbage -d
  # ==========================================================================

  nix.gc = {
    # Enable automatic garbage collection
    automatic = true;

    # When to run GC (systemd calendar format)
    # Examples: "daily", "weekly", "monthly", "03:15" (daily at 3:15 AM)
    dates = "weekly";

    # Delete generations older than N days
    options = "--delete-older-than 30d";

    # Run GC even when on battery power
    # persistent = true;

    # Randomize GC time by up to N seconds (reduces server load)
    # randomizedDelaySec = "45min";
  };

  # ==========================================================================
  # Store Optimization
  # Hard-link identical files to save disk space
  # Manual: nix-store --optimise
  # ==========================================================================

  nix.optimise = {
    # Enable automatic store optimization
    automatic = true;

    # When to run optimization
    dates = [ "weekly" ];
  };

  # ==========================================================================
  # Auto-GC Based on Disk Space (in nix.settings)
  # Triggers GC when disk space is low
  # ==========================================================================

  # nix.settings = {
  #   # Start GC when free space drops below this (bytes)
  #   min-free = 1073741824;  # 1GB
  #
  #   # Stop GC when free space reaches this (bytes)
  #   max-free = 5368709120;  # 5GB
  # };
}
