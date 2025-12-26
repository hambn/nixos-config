{ pkgs, ... }: {
  # Flatpak - Universal app distribution system
  services.flatpak.enable = true;

  # XDG Desktop Portal for flatpak integration
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Add flatpak repo after flatpak is enabled
  # Run manually once: flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}
