{ ... }: {
  # Firefox - Open source web browser by Mozilla
  # Privacy-focused browser with extensive extension support
  # Profile data: ~/.mozilla/firefox/ (nix) or ~/.var/app/org.mozilla.firefox/ (flatpak)
  # User settings: ~/.mozilla/firefox/*.default/user.js
  # System policies: /etc/firefox/policies/policies.json

  # NixOS package (commented - using flatpak instead)
  # programs.firefox.enable = true;

  # Flatpak version - sandboxed with automatic updates
  services.flatpak.packages = [
    "org.mozilla.firefox"
  ];
}