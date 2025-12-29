{ pkgs, ... }: {
  # btop - Resource monitor (modern replacement for htop/top)
  # Shows CPU, memory, disk, network and processes with a modern interface
  # Interactive process viewer with mouse support
  # Configuration: ~/.config/btop/btop.conf
  environment.systemPackages = [ pkgs.btop ];
}
