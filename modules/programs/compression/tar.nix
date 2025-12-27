{ pkgs, ... }: {
  # GNU tar - Archiving utility
  # Creates and extracts .tar archives
  # Supports compression with gzip (.tar.gz), bzip2 (.tar.bz2), xz (.tar.xz)
  # Note: Usually pre-installed on most NixOS systems
  environment.systemPackages = [ pkgs.gnutar ];
}
