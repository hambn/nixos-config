{ ... }: {
  # OpenSSH - Secure Shell client and server
  # User config: ~/.ssh/config
  # User keys: ~/.ssh/id_ed25519, ~/.ssh/id_rsa
  # Known hosts: ~/.ssh/known_hosts
  # System config: /etc/ssh/ssh_config (client), /etc/ssh/sshd_config (server)

  # SSH client configuration (programs.ssh)
  programs.ssh = {
    # SSH client is enabled by default
    # Configuration for all users in /etc/ssh/ssh_config

    # Example client options:
    # startAgent = true;  # Start SSH agent on login
    # forwardX11 = false;  # Disable X11 forwarding by default

    # Example host-specific configuration:
    # extraConfig = ''
    #   Host example
    #     HostName example.com
    #     User myuser
    #     Port 22
    # '';
  };

  # SSH server configuration (services.openssh)
  # Uncomment to enable SSH server:
  # services.openssh = {
  #   enable = true;
  #   ports = [ 22 ];
  #   settings = {
  #     PasswordAuthentication = false;
  #     PermitRootLogin = "no";
  #     X11Forwarding = false;
  #   };
  # };
}
