{ pkgs, lib, ... }: {
  home.username = "test";
  home.homeDirectory = lib.mkForce "/home/test";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
