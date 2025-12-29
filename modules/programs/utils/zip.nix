{ pkgs, ... }: {
  # zip - Package and compress (archive) files
  # Creates .zip archives compatible with PKZIP and WinZip
  # Supports compression and encryption
  environment.systemPackages = [ pkgs.zip ];
}
