{ ... }: {
  # Bash shell configuration
  programs.bash = {
    # Bash is enabled by default in NixOS

    # Enable bash completion
    enableCompletion = true;

    # Bash aliases (uncomment to add)
    # shellAliases = {
    #   ll = "ls -l";
    #   la = "ls -la";
    # };
  };
}
