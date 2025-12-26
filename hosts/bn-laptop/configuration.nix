# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader - Now configured in modules/system/boot.nix
  # boot.loader.timeout = 0;
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "bn-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking - Now configured in modules/system/networking.nix
  # networking.networkmanager.enable = true;

  # Set your time zone (host-specific, keep here if different from default)
  time.timeZone = "Asia/Tehran";

  # Select internationalisation properties - Now configured in modules/system/locale.nix
  # i18n.defaultLocale = "en_US.UTF-8";

  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "en_US.UTF-8";
  #   LC_IDENTIFICATION = "en_US.UTF-8";
  #   LC_MEASUREMENT = "en_US.UTF-8";
  #   LC_MONETARY = "en_US.UTF-8";
  #   LC_NAME = "en_US.UTF-8";
  #   LC_NUMERIC = "en_US.UTF-8";
  #   LC_PAPER = "en_US.UTF-8";
  #   LC_TELEPHONE = "en_US.UTF-8";
  #   LC_TIME = "en_US.UTF-8";
  # };

  # Enable the X11 windowing system - Now configured in modules/desktop/xserver.nix
  # services.xserver.enable = true;

  # Enable the GNOME Desktop Environment - Now configured in modules/desktop/gnome.nix
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11 - Now configured in modules/desktop/xserver.nix
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # };

  # Enable CUPS to print documents - Now configured in modules/hardware/printers.nix
  # services.printing.enable = true;

  # Enable sound with pipewire - Now configured in modules/hardware/audio.nix
  # services.pulseaudio.enable = false;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  #   # If you want to use JACK applications, uncomment this
  #   #jack.enable = true;

  #   # use the example session manager (no others are packaged yet so this is enabled by default,
  #   # no need to redefine it in your config for now)
  #   #media-session.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account - Now configured in modules/system/users.nix
  # Don't forget to set a password with 'passwd'
  # users = {
  #   users.hambn = {
  #     isNormalUser = true;
  #     description = "hamed ghasempour user";
  #     extraGroups = [ "networkmanager" "wheel" ];
  #     packages = with pkgs; [
  #     #  thunderbird
  #     ];
  #   };
  #   users.test = {
  #     isNormalUser = true;
  #     description = "test user";
  #     extraGroups = [ "networkmanager" "wheel" ];
  #     packages = with pkgs; [
  #     #  thunderbird
  #     ];
  #   };
  # };

  # Install firefox - Now configured in modules/apps/browsers/firefox.nix
  # programs.firefox.enable = true;

  # Allow unfree packages - Now configured in modules/nix/settings.nix
  # nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # NVIDIA - Now configured in hosts/bn-laptop/modules/nvidia.nix
  # All NVIDIA settings including Optimus/Prime configuration are in the host-specific module

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
