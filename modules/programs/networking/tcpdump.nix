{ pkgs, ... }: {
  # tcpdump - Network packet analyzer
  # Captures and displays network traffic in real-time
  # Command-line packet sniffer for troubleshooting network issues
  # Requires root privileges to capture packets
  environment.systemPackages = [ pkgs.tcpdump ];
}
