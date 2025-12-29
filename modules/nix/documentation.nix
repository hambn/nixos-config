{ pkgs, ... }: {
  # ==========================================================================
  # NixOS Documentation Settings
  # Man pages, info pages, and help commands
  # ==========================================================================

  documentation = {
    # ------------------------------------------------------------------------
    # General Documentation
    # ------------------------------------------------------------------------

    # Enable documentation (master switch)
    # enable = true;

    # Install documentation to /share/doc
    # doc.enable = true;

    # ------------------------------------------------------------------------
    # Man Pages
    # ------------------------------------------------------------------------

    # man = {
    #   Enable man pages
    #   enable = true;

    #   Generate man page index for apropos/whatis
    #   Makes `apropos <keyword>` and `man -k <keyword>` work
    #   generateCaches = true;
    # };

    # ------------------------------------------------------------------------
    # Info Pages
    # ------------------------------------------------------------------------

    # Enable GNU info pages (used by many GNU tools)
    # info.enable = true;

    # ------------------------------------------------------------------------
    # Developer Documentation
    # ------------------------------------------------------------------------

    # Include developer man pages (section 2, 3)
    # Useful for C/systems programming
    # dev.enable = true;

    # ------------------------------------------------------------------------
    # NixOS-Specific Documentation
    # ------------------------------------------------------------------------

    # nixos = {
    #   Enable NixOS manual and nixos-help command
    #   enable = true;

    #   Include options from all modules (slower eval, more complete)
    #   includeAllModules = true;
    # };
  };

  # ==========================================================================
  # Additional Man Page Packages
  # ==========================================================================

  environment.systemPackages = with pkgs; [
    # Linux programmer's manual (syscalls, library functions)
    # man-pages

    # POSIX man pages
    # man-pages-posix

    # Nix/NixOS specific
    # nix-doc              # Nix function documentation

    # Arch Wiki offline (searchable)
    # arch-wiki-docs

    # TLDR pages (simplified man pages)
    # tldr

    # Cheat sheets
    # cheat
  ];

  # ==========================================================================
  # Help Commands Available After Enabling
  # ==========================================================================
  #
  # man <command>              - Manual pages
  # man 5 configuration.nix    - NixOS configuration options
  # apropos <keyword>          - Search man pages by keyword
  # whatis <command>           - One-line description
  # info <command>             - GNU info pages
  # nixos-help                 - Open NixOS manual in browser
  # nixos-option <option>      - Query NixOS option values
  # nix-locate <file>          - Find which package provides a file
}
