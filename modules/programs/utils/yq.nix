{ pkgs, ... }: {
  # yq - Command-line YAML/XML/TOML processor (Go version by Mike Farah)
  # Like jq but for YAML, XML, and TOML formats
  # Query, merge, and transform structured data files
  # Usage: yq '.key' file.yaml
  environment.systemPackages = [
    pkgs.yq
    # pkgs.yq-go   # Same as yq (alias)
    # pkgs.dasel   # Multi-format selector (JSON, YAML, TOML, XML)
  ];
}
