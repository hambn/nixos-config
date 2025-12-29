{ pkgs, ... }: {
  # iotop - I/O monitor (shows disk I/O usage by process)
  # Displays which processes are using disk I/O
  # Requires root privileges to run
  # Usage: sudo iotop
  environment.systemPackages = [ pkgs.iotop ];
}
