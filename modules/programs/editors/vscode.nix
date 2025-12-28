{ pkgs, ... }: {
  # Visual Studio Code
  environment.systemPackages = with pkgs; [
    # vscode
    # Or use the open source version:
    # vscodium
  ];
}
