{ pkgs, ... }: {
  # Bottles - Windows app manager using Wine/Proton
  # Run Windows applications and games on Linux
  #
  # IMPORTANT: Bottles from nixpkgs has known issues on NixOS:
  # - Gets stuck during runtime preparation (step 6/13)
  # - Fails due to NixOS's non-FHS filesystem structure
  # - Runners expect /lib64/ld-linux-x86-64.so.2 which doesn't exist
  #
  # SOLUTION: Using Flatpak version (installed declaratively)
  # Bottles is automatically installed via modules/system/pkgmanager/flatpak.nix
  # The Flatpak version is officially supported and works reliably on NixOS.
  #
  # References:
  # - https://github.com/NixOS/nixpkgs/issues/250159
  # - https://github.com/bottlesdevs/Bottles/issues/72
  # - https://docs.usebottles.com/getting-started/installation
  # - https://github.com/gmodena/nix-flatpak (declarative management)

  # Wine dependencies (useful even with Flatpak Bottles)
  environment.systemPackages = with pkgs; [
    wine                  # Wine compatibility layer
    winetricks            # Install Windows components
    cabextract            # Extract Windows cabinet files
  ];

  # Enable 32-bit graphics support for Wine/Gaming
  hardware.graphics.enable32Bit = true;

  # Enable gamemode for better gaming performance
  programs.gamemode.enable = true;
}
