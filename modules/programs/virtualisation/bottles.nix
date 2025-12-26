{ pkgs, ... }: {
  # Bottles - Windows app manager using Wine/Proton
  # Run Windows applications and games on Linux
  environment.systemPackages = [ pkgs.bottles ];

  # Enable 32-bit libraries for Wine compatibility
  # hardware.graphics.enable32Bit = true;
}
