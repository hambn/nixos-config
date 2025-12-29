{ pkgs, ... }: {
  # gzip - GNU compression utility
  # Standard compression tool using LZ77 algorithm
  # Commands: gzip, gunzip, zcat
  environment.systemPackages = [ pkgs.gzip ];
}
