{ ... }: {
  # ytDownloader - YouTube video and audio downloader
  # Download videos from YouTube and other platforms
  # Data: ~/.var/app/io.github.aandrew_me.ytdn/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "io.github.aandrew_me.ytdn"
    # "com.github.unrud.VideoDownloader"  # Video Downloader - Alternative
  ];
}
