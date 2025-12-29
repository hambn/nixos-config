{ pkgs, ... }: {
  # GNU grep - Search text using patterns
  # Searches files for lines matching a pattern (regular expression)
  # Essential tool for text searching and filtering
  # Note: Usually pre-installed on most NixOS systems
  environment.systemPackages = [ pkgs.gnugrep ];
}
