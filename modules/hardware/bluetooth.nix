{ ... }: {
  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Bluetooth manager GUI (for GNOME/GTK desktops)
  services.blueman.enable = true;
}
