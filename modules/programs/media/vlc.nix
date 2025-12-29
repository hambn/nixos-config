{ ... }: {
  # VLC Media Player - Free and open source multimedia player
  # Plays most multimedia files and streaming protocols
  # Data: ~/.var/app/org.videolan.VLC/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "org.videolan.VLC"
    # "io.mpv.Mpv"               # mpv - Minimalist video player
  ];
}
