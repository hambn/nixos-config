{ pkgs, ... }: {
  # Google Chrome
  environment.systemPackages = with pkgs; [
    # google-chrome
    # Or use Chromium (open source):
    # chromium
  ];
}
