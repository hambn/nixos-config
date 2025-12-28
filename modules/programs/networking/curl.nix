{ pkgs, ... }: {
  # curl - Command line tool for transferring data with URLs
  # Supports HTTP, HTTPS, FTP, FTPS, and many other protocols
  # Used for downloading files, testing APIs, and web scraping
  # Configuration: ~/.curlrc for user settings
  environment.systemPackages = [ pkgs.curl ];
}
