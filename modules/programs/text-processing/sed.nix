{ pkgs, ... }: {
  # GNU sed - Stream editor
  # Non-interactive text editor for filtering and transforming text
  # Performs basic text transformations on input streams
  # Note: Usually pre-installed on most NixOS systems
  environment.systemPackages = [ pkgs.gnused ];
}
