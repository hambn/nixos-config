{ pkgs, ... }: {
  # Docker - Container runtime and platform
  # Industry-standard containerization for building, shipping, and running apps
  # Data: /var/lib/docker/
  # User config: ~/.docker/config.json
  # Start daemon: sudo systemctl start docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  # Add users to docker group (run without sudo)
  users.users = {
    hambn.extraGroups = [ "docker" ];
    test.extraGroups = [ "docker" ];
  };

  # Docker Compose - define multi-container applications
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}