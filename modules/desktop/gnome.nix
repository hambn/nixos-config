{ ... }: {
  # Enable GNOME Desktop Environment
  services.xserver.desktopManager.gnome.enable = true;

  # GNOME Display Manager
  services.xserver.displayManager.gdm.enable = true;

  # Exclude default GNOME apps (uncomment to customize)
  # environment.gnome.excludePackages = with pkgs; [
  #   gnome-tour
  #   epiphany  # web browser
  #   geary     # email client
  #   gnome-music
  # ];
}
