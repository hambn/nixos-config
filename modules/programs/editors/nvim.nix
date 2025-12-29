{ pkgs, ... }: {
  # Neovim - Hyperextensible Vim-based text editor
  # Modern fork of Vim with Lua scripting, built-in LSP, and async plugins
  # Configuration: ~/.config/nvim/init.lua (or init.vim)
  # Lua modules: ~/.config/nvim/lua/
  # Check config path: :echo stdpath('config')
  programs.neovim = {
    enable = false;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
  };

  # Alternative: install as a package
  # environment.systemPackages = [ pkgs.neovim ];
}
