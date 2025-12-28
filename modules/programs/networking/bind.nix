{ pkgs, ... }: {
  # BIND DNS utilities (dig, nslookup, host)
  # Domain Name System tools for querying DNS servers
  # dig - flexible DNS lookup tool
  # nslookup - query Internet name servers
  # host - DNS lookup utility
  environment.systemPackages = [ pkgs.bind ];
}
