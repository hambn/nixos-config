{ ... }: {
  # qBittorrent - Free and open source BitTorrent client
  # Feature-rich torrent client with built-in search and RSS support
  # Data: ~/.var/app/org.qbittorrent.qBittorrent/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "org.qbittorrent.qBittorrent"
    # "de.haeckerfelix.Fragments"  # Fragments - Simple GTK torrent client
  ];
}
