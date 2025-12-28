{ pkgs, ... }: {
  # mtr - Network diagnostic tool (combines ping and traceroute)
  # My TraceRoute - continuously monitors network path
  # Shows packet loss and latency for each hop
  # Interactive and real-time network path analysis
  environment.systemPackages = [ pkgs.mtr ];
}
