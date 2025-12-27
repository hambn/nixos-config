{ pkgs, ... }: {
  # traceroute - Print the route packets trace to network host
  # Shows the path packets take to reach a destination
  # Displays each hop along the route with timing information
  # Useful for diagnosing network routing issues
  environment.systemPackages = [ pkgs.traceroute ];
}
