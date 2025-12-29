{ pkgs, ... }: {
  # p7zip - 7-Zip file archiver
  # Supports 7z, ZIP, GZIP, BZIP2, TAR, and many other formats
  # Provides high compression ratio with LZMA algorithm
  # Commands: 7z, 7za, 7zr
  environment.systemPackages = [ pkgs.p7zip ];
}
