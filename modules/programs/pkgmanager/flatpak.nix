{ pkgs, ... }: {
  # Flatpak - Universal sandboxed application distribution
  # Cross-distro package format with built-in sandboxing and dependencies
  # System apps: /var/lib/flatpak/
  # User apps: ~/.local/share/flatpak/
  # App data: ~/.var/app/
  # Manage with: flatpak install/uninstall/update/list
  services.flatpak = {
    enable = true;

    # Flatpak remotes (repositories)
    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];

    # Remove Flatpaks not declared in packages list above
    # WARNING: Will uninstall manually installed Flatpaks on rebuild
    # uninstallUnmanaged = false;

    # Auto-update Flatpaks on system activation (nixos-rebuild switch)
    # Default is false for idempotent rebuilds
    update.onActivation = true;

    # Scheduled auto-updates via systemd timer
    update.auto = {
      enable = false;
      onCalendar = "weekly";    # systemd calendar expression
    };

    # Per-app permission overrides (alternative to Flatseal)
    # overrides = {
    #   "com.spotify.Client" = {
    #     Context.filesystems = [ "~/Music:ro" ];
    #   };
    # };
  };

  # XDG Desktop Portal - required for Flatpak sandboxing
  # Provides standardized APIs for file access, screenshots, notifications, etc.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # Portal backend configuration (Nix-only)
    # config.common.default = "*";    # Use any available portal
  };
}
