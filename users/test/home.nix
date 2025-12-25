{ pkgs, ... }: {
  home.username = "test";
  home.homeDirectory = lib.mkForce "/home/test";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    htop
  ];

  programs.home-manager.enable = true;
}
