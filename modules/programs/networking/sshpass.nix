{ pkgs, ... }: {
  # sshpass - Non-interactive SSH password authentication
  # Provides password to SSH in scripts (not recommended for production)
  # Usage: sshpass -p 'password' ssh user@host
  # Security warning: Passwords visible in process list
  environment.systemPackages = [ pkgs.sshpass ];
}
