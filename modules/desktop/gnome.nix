{ ... }: {
  # Enable GNOME Desktop Environment
  services.xserver.desktopManager.gnome.enable = false;

  # GNOME Display Manager
  services.xserver.displayManager.gdm.enable = false;

  # Exclude default GNOME apps (uncomment to customize)
  # environment.gnome.excludePackages = with pkgs; [
  #   gnome-tour
  #   epiphany  # web browser
  #   geary     # email client
  #   gnome-music
  # ];
}
