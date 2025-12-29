{ ... }: {
  # Proton Mail - End-to-end encrypted email service
  # Secure email with zero-access encryption
  # Data: ~/.var/app/me.proton.Mail/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "me.proton.Mail"
  ];
}
