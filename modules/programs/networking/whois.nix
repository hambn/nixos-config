{ pkgs, ... }: {
  # whois - Client for the whois directory service
  # Queries domain registration and IP address information
  # Shows ownership, registration dates, and nameserver details
  # Useful for investigating domains and network blocks
  environment.systemPackages = [ pkgs.whois ];
}
