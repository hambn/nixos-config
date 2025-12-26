{ pkgs, ... }: {
  # Bottles - Windows app manager using Wine/Proton
  # Run Windows applications and games on Linux
  #
  # IMPORTANT: Bottles from nixpkgs has known issues on NixOS:
  # - Gets stuck during runtime preparation (step 6/13)
  # - Fails due to NixOS's non-FHS filesystem structure
  # - Runners expect /lib64/ld-linux-x86-64.so.2 which doesn't exist
  #
  # RECOMMENDED: Use Flatpak version instead!
  # After nixos-rebuild, run:
  #   flatpak install flathub com.usebottles.bottles
  #
  # The Flatpak version is officially supported and works reliably on NixOS.
  #
  # References:
  # - https://github.com/NixOS/nixpkgs/issues/250159
  # - https://github.com/bottlesdevs/Bottles/issues/72
  # - https://docs.usebottles.com/getting-started/installation

  # Uncomment to install via nixpkgs (NOT RECOMMENDED - has issues)
  # environment.systemPackages = with pkgs; [
  #   bottles
  # ];

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
