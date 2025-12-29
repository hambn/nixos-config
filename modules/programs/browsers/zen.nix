{ ... }: {
  # Zen Browser - Privacy-focused Firefox-based browser
  # Minimalist browser with built-in ad blocking and privacy features
  # Data: ~/.var/app/app.zen_browser.zen/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "app.zen_browser.zen"
    # "io.gitlab.AJenbo.Sherern"  # Librewolf - Privacy hardened Firefox fork
  ];
}
