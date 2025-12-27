{ pkgs, ... }: {
  # nmap - Network exploration and security auditing tool
  # Port scanner and network discovery tool
  # Used for network inventory, security scanning, and monitoring
  # Includes ncat (modern netcat) and nping utilities
  environment.systemPackages = [ pkgs.nmap ];
}
