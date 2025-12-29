{ pkgs, ... }: {
  # SSHFS - Filesystem client based on SSH
  # Mount remote directories over SSH as local filesystems
  # Usage: sshfs user@host:/remote/path /local/mount/point
  # Unmount: fusermount -u /local/mount/point
  environment.systemPackages = [ pkgs.sshfs ];
}
