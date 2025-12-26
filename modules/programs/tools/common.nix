{ pkgs, ... }: {
  # Common system utilities
  environment.systemPackages = with pkgs; [
    wget              # Download files
    curl              # Transfer data with URLs
    unzip             # Extract ZIP archives
    zip               # Create ZIP archives
    p7zip             # 7-Zip archive support
  ];
}
