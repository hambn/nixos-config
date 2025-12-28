{ pkgs, ... }: {
  # iputils - Basic networking utilities
  # Includes: ping, tracepath, arping, clockdiff
  # Essential tools for network diagnostics and testing
  # ping - test network connectivity
  environment.systemPackages = [ pkgs.iputils ];
}
