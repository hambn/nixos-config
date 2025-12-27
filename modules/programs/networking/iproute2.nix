{ pkgs, ... }: {
  # iproute2 - Advanced IP routing and network configuration
  # Modern replacement for net-tools (ifconfig, route, etc.)
  # Includes: ip, ss, bridge, rtmon, tc
  # Used for network interface and routing table management
  environment.systemPackages = [ pkgs.iproute2 ];
}
