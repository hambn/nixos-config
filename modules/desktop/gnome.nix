{ ... }: {
  # Enable GNOME Desktop Environment
  services.desktopManager.gnome.enable = true;

  # GNOME Display Manager
  services.displayManager.gdm.enable = true;

  # Exclude default GNOME apps (uncomment to customize)
  # environment.gnome.excludePackages = with pkgs; [
  #   gnome-tour
  #   epiphany  # web browser
  #   geary     # email client
  #   gnome-music
  # ];
}
