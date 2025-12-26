{ ... }: {
  # Bootloader configuration
  boot.loader = {
    timeout = 0;  # 0 = skip boot menu, boot immediately
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Kernel parameters (uncomment and adjust as needed)
  # boot.kernelParams = [ "quiet" "splash" ];
}
