{ pkgs, ... }: {
  # ==========================================================================
  # NixOS Compatibility Settings
  # Run software not packaged for NixOS
  # ==========================================================================

  # --------------------------------------------------------------------------
  # nix-ld: Run unpatched Linux binaries
  # Provides /lib64/ld-linux-x86-64.so.2 that other distros have
  # Useful for: VSCode extensions, npm binaries, proprietary software
  # --------------------------------------------------------------------------

  programs.nix-ld = {
    enable = true;

    # Use Rust implementation (faster, smaller)
    # package = pkgs.nix-ld-rs;

    # Common libraries that binaries might need
    # These are available to all unpatched binaries via NIX_LD_LIBRARY_PATH
    libraries = with pkgs; [
      # Core libraries
      stdenv.cc.cc.lib    # libstdc++, libgcc_s
      zlib                # Compression
      openssl             # SSL/TLS

      # Common dependencies
      # curl
      # glib
      # nss
      # nspr
      # atk
      # cups
      # libdrm
      # gtk3
      # pango
      # cairo
      # xorg.libX11
      # xorg.libXcomposite
      # xorg.libXdamage
      # xorg.libXext
      # xorg.libXfixes
      # xorg.libXrandr
      # xorg.libxcb
      # mesa
      # expat
      # libxkbcommon
      # alsa-lib

      # For Electron apps (VSCode, Discord, etc.)
      # gdk-pixbuf
      # libnotify
      # libappindicator
    ];
  };

  # --------------------------------------------------------------------------
  # FHS Environment (alternative to nix-ld)
  # Creates a full FHS-compliant environment
  # Use with: fhs-run <command>
  # --------------------------------------------------------------------------

  # environment.systemPackages = [
  #   (pkgs.buildFHSUserEnv {
  #     name = "fhs";
  #     targetPkgs = pkgs: with pkgs; [
  #       # Add packages available inside the FHS environment
  #       gcc
  #       zlib
  #     ];
  #     runScript = "bash";
  #   })
  # ];

  # --------------------------------------------------------------------------
  # Steam compatibility (for gaming)
  # Provides 32-bit libraries and FHS environment
  # --------------------------------------------------------------------------

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  #   dedicatedServer.openFirewall = true;
  # };

  # --------------------------------------------------------------------------
  # AppImage support
  # Run .AppImage files directly
  # --------------------------------------------------------------------------

  # programs.appimage = {
  #   enable = true;
  #   binfmt = true;  # Register with binfmt for direct execution
  # };

  # --------------------------------------------------------------------------
  # Alien package formats
  # Convert/run packages from other distros
  # --------------------------------------------------------------------------

  # environment.systemPackages = with pkgs; [
  #   # Convert .deb/.rpm to Nix
  #   dpkg
  #   rpm
  #
  #   # Extract packages
  #   binutils  # ar for .deb
  #   cpio      # for .rpm
  # ];
}
