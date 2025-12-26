{ pkgs, ... }: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  users.users = {
    hambn.extraGroups = [ "docker" ];
    test.extraGroups = [ "docker" ];
  };
  
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}