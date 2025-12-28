{ pkgs, ... }: {
  # net-tools - Legacy networking utilities
  # Includes: ifconfig, netstat, route, arp, hostname
  # Note: These are deprecated in favor of iproute2 (ip, ss)
  # Kept for compatibility with older scripts and documentation
  environment.systemPackages = [ pkgs.net-tools ];
}
