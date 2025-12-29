{ ... }: {
  # DistroShelf - Linux distribution browser and downloader
  # Browse, download, and manage Linux distribution ISOs
  # Data: ~/.var/app/io.github.AJenbo.distroshelf/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "io.github.AJenbo.distroshelf"
  ];
}
