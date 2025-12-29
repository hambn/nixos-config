{ pkgs, ... }: {
  # jq - Command-line JSON processor
  # Lightweight and flexible tool for parsing, filtering, and transforming JSON
  # Essential for working with JSON APIs and data
  # Usage: echo '{"key":"value"}' | jq '.key'
  environment.systemPackages = [ pkgs.jq ];
}
