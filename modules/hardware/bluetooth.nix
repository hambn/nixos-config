{ ... }: {
  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Bluetooth manager GUI (for GNOME/GTK desktops)
  services.blueman.enable = true;
}
