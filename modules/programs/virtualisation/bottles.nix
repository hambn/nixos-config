{ pkgs, lib, ... }: {
  # Bottles - Windows app manager via Flatpak (declarative install)
  services.flatpak.packages = lib.mkForce [
    "com.usebottles.bottles"
  ];

  # System packages to support Wine/Vulkan usage
  environment.systemPackages = with pkgs; [
    flatpak

    # Wine (32- & 64-bit) helpers
    wineWowPackages.stable
    winetricks

    # Vulkan support and translation libs
    vulkan-loader
    vulkan-tools
    dxvk
    vkd3d
  ];

  # 32-bit OpenGL/Vulkan support required for many Wine prefixes
  hardware.opengl.driSupport32Bit = true;
}
