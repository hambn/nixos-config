{ config, pkgs, ... }: {
  # NVIDIA configuration for bn-laptop with Optimus support

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

    # Fine-grained power management for laptop battery life
    # Turns off GPU when not in use
    powerManagement.finegrained = true;

    # NVIDIA settings menu
    nvidiaSettings = true;

    # Optionally, specify driver version
    # package = config.boot.kernelPackages.nvidiaPackages.stable;

    # NVIDIA Prime configuration for hybrid graphics (Intel + NVIDIA)
    # Offload mode - GPU off until needed, use with nvidia-offload command
    # Bus IDs specific to this laptop hardware (find with: lspci | grep -E "VGA|3D")
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
