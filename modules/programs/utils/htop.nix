{ pkgs, ... }: {
  # htop - Interactive process viewer
  # Enhanced replacement for the 'top' command
  # Shows CPU, memory, swap usage and running processes
  # Configuration: ~/.config/htop/htoprc
  environment.systemPackages = [ pkgs.htop ];
}