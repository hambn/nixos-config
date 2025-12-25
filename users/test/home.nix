{ pkgs, ... }: {
  home.username = "test";
  home.homeDirectory = "/home/test";
  system.stateVersion = "25.11";

  home.packages = with pkgs; [
    htop
  ];

  programs.home-manager.enable = true;
}
