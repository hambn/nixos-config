{ ... }: {
  # Bash shell configuration
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
