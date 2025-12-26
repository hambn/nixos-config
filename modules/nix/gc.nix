{ ... }: {
  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Optimize store automatically
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
}
