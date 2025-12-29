{ pkgs, ... }: {
  # Podman - Daemonless container engine
  # Docker-compatible, rootless containers without daemon
  # Data: ~/.local/share/containers/ (rootless)
  # Supports pods (group of containers sharing resources)
  virtualisation.podman = {
    enable = true;
    # dockerCompat = true;  # Alias 'docker' command to podman
    defaultNetwork.settings.dns_enabled = true;  # Containers resolve each other by name
  };

  # Add users to podman group
  users.users = {
    hambn.extraGroups = [ "podman" ];
    test.extraGroups = [ "podman" ];
  };

  # Podman Compose - docker-compose compatible tool
  environment.systemPackages = with pkgs; [
    podman-compose
  ];
}