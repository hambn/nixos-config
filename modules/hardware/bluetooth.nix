{ ... }: {
  # Enable bluetooth
  hardware.bluetooth = {
    enable = false;
    powerOnBoot = false;
  };

  # Bluetooth manager GUI (for GNOME/GTK desktops)
  # services.blueman.enable = true;
}
