{ pkgs, ... }: {
  # Alacritty terminal emulator
  environment.systemPackages = [ pkgs.alacritty ];

  # Or enable as a program
  # programs.alacritty.enable = true;
}
