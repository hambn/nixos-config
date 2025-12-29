{ ... }: {
  # Spotify - Music streaming service
  # Access millions of songs, podcasts, and playlists
  # Data: ~/.var/app/com.spotify.Client/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "com.spotify.Client"
    # "dev.alextren.Spot"        # Spot - Native GTK Spotify client
  ];
}
