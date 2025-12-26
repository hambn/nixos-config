{ config, pkgs, ... }: {
  # Enable OpenGL
  hardware.graphics.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Use proprietary driver (set to true for open source)
    open = false;

    # Enable power management
    powerManagement.enable = true;

    # Fine-grained power management (turns off GPU when not in use)
    # Set to true for laptops with Optimus to save battery
    powerManagement.finegrained = false;

    # NVIDIA settings menu
    nvidiaSettings = true;

    # Optionally, specify driver version
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # For laptops with hybrid graphics (Intel + NVIDIA)
  # Uncomment and adjust bus IDs as needed (find with: lspci | grep -E "VGA|3D")
  # Note: Bus IDs are hardware-specific, configure in host file if needed
  # hardware.nvidia.prime = {
  #   offload.enable = true;
  #   offload.enableOffloadCmd = true;
  #   intelBusId = "PCI:0:2:0";
  #   nvidiaBusId = "PCI:1:0:0";
  # };
}
