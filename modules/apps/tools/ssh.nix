{ ... }: {
  # OpenSSH daemon
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
