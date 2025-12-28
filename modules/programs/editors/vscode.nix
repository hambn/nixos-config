{ pkgs, ... }: {
  # Visual Studio Code via Flatpak
  # Using Flatpak for better extension compatibility and marketplace access
  services.flatpak.packages = [
    "com.visualstudio.code"
  ];
}
