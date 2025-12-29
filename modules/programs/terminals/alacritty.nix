{ pkgs, ... }: {
  # Alacritty - GPU-accelerated terminal emulator
  # Fast, cross-platform terminal using OpenGL for rendering
  # Configuration: ~/.config/alacritty/alacritty.toml
  # Live reload enabled by default (changes apply on save)
  # Migrate old config: alacritty migrate (YAML to TOML)
  environment.systemPackages = [ pkgs.alacritty ];

  # Or enable as a program
  # programs.alacritty.enable = true;
}
