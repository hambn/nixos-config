{ pkgs, ... }: {
  home.username = "test";
  home.homeDirectory = "/home/test";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    htop
  ];

  programs.home-manager.enable = true;
}
