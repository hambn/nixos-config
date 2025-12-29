{ ... }: {
  # ==========================================================================
  # Nix Build Optimization
  # Settings to speed up builds and reduce resource usage
  # ==========================================================================

  nix.settings = {
    # ------------------------------------------------------------------------
    # Parallel Build Settings
    # ------------------------------------------------------------------------

    # Max parallel build jobs ("auto" = CPU cores)
    # Reduce if running out of RAM during builds
    max-jobs = "auto";

    # CPU cores per job (0 = all cores)
    # For heavy builds, try cores = 4 with max-jobs = 2
    cores = 0;

    # ------------------------------------------------------------------------
    # Store Optimization
    # ------------------------------------------------------------------------

    # Hard-link identical files automatically during builds
    # Saves disk space, slight build time overhead
    auto-optimise-store = true;

    # ------------------------------------------------------------------------
    # Network Optimization
    # ------------------------------------------------------------------------

    # Timeout for cache connections (default 300s is too long)
    connect-timeout = 5;

    # Max parallel downloads from caches
    # http-connections = 50;

    # Download buffer size (increase for fast connections)
    # download-buffer-size = 134217728;  # 128MB

    # ------------------------------------------------------------------------
    # Build Caching
    # ------------------------------------------------------------------------

    # Keep build outputs (prevents rebuilding after GC)
    keep-outputs = true;

    # Keep derivation files (for debugging)
    keep-derivations = true;

    # Fall back to source build if cache fails
    fallback = true;
  };

  # ==========================================================================
  # System Resource Limits
  # Prevent builds from consuming all system resources
  # ==========================================================================

  # Limit memory for nix-daemon builds
  # systemd.services.nix-daemon.serviceConfig = {
  #   MemoryMax = "75%";
  #   CPUQuota = "80%";
  # };
}
