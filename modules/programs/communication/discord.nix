{ ... }: {
  # Discord - Voice, video and text communication platform
  # Gaming-focused chat with servers, channels, and voice rooms
  # Data: ~/.var/app/com.discordapp.Discord/
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "com.discordapp.Discord"
    # "dev.vencord.Vesktop"      # Vencord - Discord client with plugins
  ];
}
