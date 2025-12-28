{ pkgs, ... }: {
  # unzip - Extract compressed files from ZIP archives
  # Decompresses .zip files created by zip, pkzip, WinZip, etc.
  # Counterpart to zip utility
  environment.systemPackages = [ pkgs.unzip ];
}
