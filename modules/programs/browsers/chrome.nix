{ pkgs, ... }: {
  # Google Chrome - Web browser by Google
  # Proprietary browser with sync, extensions, and developer tools
  # Configuration: ~/.config/google-chrome/
  environment.systemPackages = [
    pkgs.google-chrome
    # pkgs.chromium              # Open source version
    # pkgs.ungoogled-chromium    # Privacy-focused, no Google services
  ];
}
