{ pkgs, ... }: {
  # Bottles - Run Windows software and games on Linux
  # Wine prefix manager with gaming optimizations and dependency management
  # Data: ~/.var/app/com.usebottles.bottles/
  # Uses Flatpak for sandboxing and easy updates
  services.flatpak.packages = [
    "com.usebottles.bottles"
  ];

  # 32-bit OpenGL/Vulkan support required for many Wine prefixes
  hardware.opengl.driSupport32Bit = true;
}
