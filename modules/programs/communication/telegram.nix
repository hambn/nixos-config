{ ... }: {
  # Telegram Desktop - Cloud-based messaging app
  # Fast messaging with groups, channels, bots, and file sharing
  # Data: ~/.var/app/org.telegram.desktop/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "org.telegram.desktop"
    # "io.github.nicotine_plus.Nicotine"  # Alternative client
  ];
}
