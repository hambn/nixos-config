{ pkgs, ... }: {
  # Flatpak - Universal app distribution system with declarative management
  # Using nix-flatpak for declarative package installation

  services.flatpak.enable = true;

  # XDG Desktop Portal for flatpak integration
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Flatpak remotes (Flathub is added by default)
  # You can add custom remotes here if needed
  services.flatpak.remotes = [{
    name = "flathub";
    location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  }];
}
