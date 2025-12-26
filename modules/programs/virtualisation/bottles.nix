{ pkgs, ... }: {
  # Bottles - Windows app manager using Wine/Proton
  # Run Windows applications and games on Linux
  
  # Install Bottles Flatpak declaratively
  services.flatpak.packages = lib.mkForce [
    "com.usebottles.bottles"  # Bottles from Flathub
  ];

  # System packages that help wine & Vulkan/DXVK support
  environment.systemPackages = with pkgs; [
    # Wine (32/64 bit)
    wineWowPackages.stable
    winetricks

    # Vulkan support + DXVK/VKD3D support from nixpkgs
    vulkan-loader
    vulkan-tools
    dxvk
    vkd3d
  ];

  # 32-bit OpenGL/Vulkan support for wine
  hardware.opengl.driSupport32Bit = true;
}
