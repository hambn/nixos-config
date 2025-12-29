{ ... }: {
  # DistroShelf - Graphical interface for managing Distrobox containers
  # Manage and run containerized Linux distributions
  # Data: ~/.var/app/com.ranfdev.DistroShelf/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "com.ranfdev.DistroShelf"
  ];
}
