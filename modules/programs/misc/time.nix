{ pkgs, ... }: {
  # GNU time - Measure program resource usage
  # Reports time, memory, and other resources used by a command
  # More detailed than the shell built-in 'time' command
  # Usage: /usr/bin/time -v [command]
  environment.systemPackages = [ pkgs.time ];
}
