{ ... }: {
  # GNU nano - Small, user-friendly console text editor
  # System-wide configuration written to /etc/nanorc
  programs.nano = {
    # Enable nano editor (usually enabled by default)
    enable = true;

    # Enable syntax highlighting for various languages
    syntaxHighlight = true;

    # System-wide nanorc configuration
    # Note: User-specific settings should be in ~/.nanorc
    # See nanorc(5) for all available options
    nanorc = ''
      # Automatically indent new lines to match previous line
      # set autoindent

      # Convert tabs to spaces
      # set tabstospaces
      # set tabsize 2

      # Disable line wrapping
      # set nowrap

      # Enable mouse support
      # set mouse

      # Show line numbers
      # set linenumbers

      # Enable smooth scrolling
      # set smooth
    '';
  };
}
