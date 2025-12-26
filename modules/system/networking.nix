{ ... }: {
  # Enable networking
  networking.networkmanager.enable = true;

  # Wireless support via wpa_supplicant (alternative to NetworkManager)
  # networking.wireless.enable = true;

  # Configure network proxy (uncomment if needed)
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall (uncomment as needed)
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether
  # networking.firewall.enable = false;
}
