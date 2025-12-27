{ pkgs, ... }: {
  # which - Locate a command
  # Shows the full path of shell commands
  # Helps identify which executable will be run
  # Usage: which [command]
  environment.systemPackages = [ pkgs.which ];
}
