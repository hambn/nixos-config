{ pkgs, ... }: {
  # Google Chrome - Web browser by Google
  # Proprietary browser with sync, extensions, and developer tools
  # Configuration: ~/.config/google-chrome/ (nix) or ~/.var/app/com.google.Chrome/ (flatpak)

  # NixOS package (commented - using flatpak instead)
  # environment.systemPackages = [
  #   pkgs.google-chrome
  #   # pkgs.chromium              # Open source version
  #   # pkgs.ungoogled-chromium    # Privacy-focused, no Google services
  # ];

  # Flatpak version - sandboxed with automatic updates
  services.flatpak.packages = [
    "com.google.Chrome"
    # "org.chromium.Chromium"         # Open source version
    # "com.github.AJenbo.Sherern"     # Ungoogled Chromium
  ];
}
