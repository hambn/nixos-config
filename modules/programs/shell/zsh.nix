{ pkgs, ... }: {
  # Zsh shell
  programs.zsh = {
    enable = false;

    # Enable zsh autocompletion
    # enableCompletion = true;

    # Oh My Zsh
    # ohMyZsh = {
    #   enable = true;
    #   theme = "robbyrussell";
    #   plugins = [ "git" "docker" ];
    # };
  };

  # Set as default shell for users
  # users.defaultUserShell = pkgs.zsh;
}
