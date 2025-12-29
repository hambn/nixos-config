{ pkgs, ... }: {
  # Zsh - Z Shell with advanced features
  # Powerful shell with better tab completion, globbing, and themes
  # User config: ~/.zshrc (interactive), ~/.zprofile (login)
  # System config: /etc/zshrc, /etc/zprofile
  programs.zsh = {
    enable = false;

    # Enable zsh autocompletion
    # enableCompletion = true;

    # Oh My Zsh - framework for managing zsh configuration
    # ohMyZsh = {
    #   enable = true;
    #   theme = "robbyrussell";
    #   plugins = [ "git" "docker" ];
    # };
  };

  # Set as default shell for users
  # users.defaultUserShell = pkgs.zsh;
}
