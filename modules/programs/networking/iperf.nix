{ pkgs, ... }: {
  # iPerf3 - Network bandwidth measurement tool
  # Tests maximum achievable bandwidth between two hosts
  # Supports TCP, UDP, and SCTP protocols
  # Useful for network performance testing and troubleshooting
  environment.systemPackages = [ pkgs.iperf3 ];
}
