{ pkgs, ... }: {
  virtualisation.podman = {
    enable = true;
    # dockerCompat = true;  # lets you run 'docker' commands -> uses podman instead
    defaultNetwork.settings.dns_enabled = true;  # containers can resolve each other by name
  };

  users.users = {
    hambn.extraGroups = [ "podman" ];
    test.extraGroups = [ "podman" ];
  };
  
  environment.systemPackages = with pkgs; [
    podman-compose
  ];
}