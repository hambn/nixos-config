{ pkgs, ... }: {
  # FlClash - Multi-platform proxy client based on ClashMeta/Mihomo
  # Flutter-based GUI with Material You design, open-source and ad-free
  # Supports subscription links, WebDAV sync, and advanced proxy rules
  # Configuration: ~/.config/flclash/
  environment.systemPackages = [ pkgs.flclash ];
}