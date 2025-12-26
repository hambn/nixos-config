{ pkgs, ... }: {
  # Define user accounts
  # Don't forget to set a password with 'passwd'

  users.users.hambn = {
    isNormalUser = true;
    description = "hamed ghasempour user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # User-specific packages
    ];
  };

  users.users.test = {
    isNormalUser = true;
    description = "test user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # User-specific packages
    ];
  };
}
