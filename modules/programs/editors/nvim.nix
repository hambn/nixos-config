{ pkgs, ... }: {
  # Neovim editor
  programs.neovim = {
    enable = false;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
  };

  # Alternative: install as a package
  # environment.systemPackages = [ pkgs.neovim ];
}
