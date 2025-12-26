{ pkgs, lib, ... }: {
  # Bottles - Windows app manager via Flatpak (declarative install)
  services.flatpak.packages = lib.mkForce [
    "com.usebottles.bottles"
  ];

  # 32-bit OpenGL/Vulkan support required for many Wine prefixes
  hardware.opengl.driSupport32Bit = true;
}
