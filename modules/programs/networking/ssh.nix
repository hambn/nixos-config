{ ... }: {
  # OpenSSH Server (sshd) - Allow remote SSH connections
  # Server config: /etc/ssh/sshd_config
  # Authorized keys: ~/.ssh/authorized_keys
  # Host keys: /etc/ssh/ssh_host_*_key
  services.openssh = {
    enable = false;

    # Security settings (uncomment if enabling)
    # settings = {
    #   PermitRootLogin = "no";
    #   PasswordAuthentication = false;
    # };
  };

  # OpenSSH client is included by default
  # programs.ssh.startAgent = true;
}
