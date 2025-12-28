{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nodePackages.claude-code
  ];
}