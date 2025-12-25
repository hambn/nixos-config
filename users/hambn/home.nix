{ pkgs, lib, ... }: {
  home.username = "hambn";
  home.homeDirectory = lib.mkForce "/home/hambn";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    htop
  ];

  programs.home-manager.enable = true;
}
