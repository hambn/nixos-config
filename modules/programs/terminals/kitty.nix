{ pkgs, ... }: {
  # Kitty terminal emulator
  environment.systemPackages = [ pkgs.kitty ];
}
