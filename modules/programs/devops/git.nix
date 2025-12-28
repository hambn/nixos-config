{ ... }: {
  # Git version control system
  # System-wide configuration written to /etc/gitconfig
  programs.git = {
    # Enable git (installs package and configures system-wide)
    enable = true;

    # System-wide git configuration
    # Note: User-specific configs (name, email, aliases) should be in ~/.gitconfig or home-manager
    config = {
      # Enable colored output for all users
      color.ui = "auto";

      # Default branch name for new repositories
      # init.defaultBranch = "main";

      # Credential helper (options: store, cache, libsecret)
      # credential.helper = "store";

      # Enable git rerere (reuse recorded resolution of conflicted merges)
      # rerere.enabled = true;
    };

    # Git Large File Storage support
    # lfs.enable = true;
  };
}