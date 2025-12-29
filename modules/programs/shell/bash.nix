{ ... }: {
  # Bash - GNU Bourne Again SHell
  # Default shell on most Linux systems
  # User config: ~/.bashrc (interactive), ~/.bash_profile (login)
  # System config: /etc/bashrc, /etc/profile
  programs.bash = {
    # Bash is enabled by default in NixOS

    # Enable bash completion
    completion.enable = true;

    # Bash aliases (uncomment to add)
    # shellAliases = {
    #   ll = "ls -l";
    #   la = "ls -la";
    # };
  };
}
