{ pkgs, ... }: {
  # Bottles - Windows app manager using Wine/Proton
  # Run Windows applications and games on Linux

  environment.systemPackages = with pkgs; [
    bottles               # Main application

    # Wine dependencies and tools
    wine                  # Wine compatibility layer
    winetricks            # Install Windows components

    # Required libraries and utilities
    cabextract            # Extract Windows cabinet files

    # Additional runtime dependencies
    gnutls                # TLS/SSL support
    libpng                # Image format support
    libjpeg               # JPEG support
    gst_all_1.gstreamer   # Multimedia framework
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
  ];

  # Enable 32-bit graphics support for Wine/Gaming
  hardware.graphics.enable32Bit = true;

  # Enable gamemode for better gaming performance
  programs.gamemode.enable = true;
}
