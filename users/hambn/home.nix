{ pkgs, ... }: {
  home.username = "hambn";
  home.homeDirectory = "/home/hambn";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    htop
  ];

  programs.home-manager.enable = true;
}
