{ pkgs, ... }: {
  # Font configuration
  fonts = {
    packages = with pkgs; [
      # Core fonts
      # noto-fonts
      # noto-fonts-cjk
      # noto-fonts-emoji
      # liberation_ttf
      # fira-code
      # fira-code-symbols

      # Nerd Fonts (for terminal icons)
      # (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];

    # fontconfig = {
    #   defaultFonts = {
    #     serif = [ "Noto Serif" ];
    #     sansSerif = [ "Noto Sans" ];
    #     monospace = [ "Fira Code" ];
    #   };
    # };
  };
}
