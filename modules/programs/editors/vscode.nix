{ pkgs, ... }: {
  # Visual Studio Code - Feature-rich code editor by Microsoft
  # Extensible with thousands of plugins, built-in Git, debugging, IntelliSense
  # Configuration: ~/.config/Code/User/settings.json
  # Extensions: ~/.vscode/extensions/
  # Using Flatpak for marketplace access and sandboxed updates
  services.flatpak.packages = [
    "com.visualstudio.code"
    # "com.vscodium.codium"    # VSCodium - FOSS build without telemetry
  ];
}
