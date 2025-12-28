{ pkgs, ... }: {
  # GNU AWK - Pattern scanning and text processing language
  # Powerful text manipulation tool for data extraction and reporting
  # Processes text line by line using patterns and actions
  # Note: Usually pre-installed on most NixOS systems
  environment.systemPackages = [ pkgs.gawk ];
}
