{ pkgs, ... }: {
  # Kitty - GPU-accelerated terminal emulator
  # Feature-rich: tabs, splits, ligatures, image support, remote control
  # Configuration: ~/.config/kitty/kitty.conf
  # Open config: Ctrl+Shift+F2 or `kitty +kitten config`
  # Supports including secondary config files via `include` directive
  environment.systemPackages = [ pkgs.kitty ];
}
