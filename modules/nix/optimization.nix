{ ... }: {
  # Nix optimization settings
  nix.settings = {
    # Enable auto-optimise during rebuild
    auto-optimise-store = true;

    # Maximum number of parallel jobs
    max-jobs = "auto";

    # Number of cores per job
    cores = 0;  # 0 = use all available cores

    # Use hard links for identical files
    # auto-optimise-store already does this, but keeping for clarity
  };
}
