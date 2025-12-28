{ pkgs, ... }: {
  # Flatpak: universal app distribution
  services.flatpak.enable = true;

  # XDG Desktop Portal integration for Flatpak
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Add Flathub remote
  services.flatpak.remotes = [{
    name     = "flathub";
    location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  }];
}
