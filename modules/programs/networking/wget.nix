{ pkgs, ... }: {
  # wget - Network downloader
  # Retrieves files from the web using HTTP, HTTPS, and FTP
  # Supports recursive downloads and resuming interrupted transfers
  # Configuration: ~/.wgetrc
  environment.systemPackages = [ pkgs.wget ];
}
