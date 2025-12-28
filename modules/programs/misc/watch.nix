{ pkgs, ... }: {
  # watch - Execute a program periodically, showing output
  # Repeatedly runs a command and displays the output
  # Useful for monitoring changes in command output
  # Usage: watch -n 2 [command]  (runs every 2 seconds)
  environment.systemPackages = [ pkgs.watch ];
}
