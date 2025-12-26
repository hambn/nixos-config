{ pkgs, ... }: {
  # Flatpak - Universal app distribution system
  services.flatpak.enable = true;

  # XDG Desktop Portal for flatpak integration
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Automatically add Flathub repository on system startup
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
