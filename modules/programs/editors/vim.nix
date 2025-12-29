{ pkgs, ... }: {
  # Vim - Vi IMproved, highly configurable text editor
  # Modal editor: Normal, Insert, Visual, Command modes
  # Configuration: ~/.vimrc (user), /etc/vim/vimrc (system)
  # Open config inside vim: :edit $MYVIMRC
  environment.systemPackages = [
    pkgs.vim
    # pkgs.vim-full    # With GUI support (gvim)
  ];
}