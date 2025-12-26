{ ... }: {
  # Bootloader configuration
  boot.loader = {
    timeout = 5;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Kernel parameters (uncomment and adjust as needed)
  # boot.kernelParams = [ "quiet" "splash" ];
}
