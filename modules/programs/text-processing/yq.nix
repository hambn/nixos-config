{ pkgs, ... }: {
  # yq - Command-line YAML/XML/TOML processor
  # Like jq but for YAML, XML, and TOML formats
  # Query, merge, and transform structured data files
  # Usage: yq '.key' file.yaml
  environment.systemPackages = [ pkgs.yq ];
}
