{ ... }: {
  # Obsidian - Knowledge base and note-taking app
  # Markdown-based notes with linking, graph view, and plugins
  # Data: ~/.var/app/md.obsidian.Obsidian/
  # Vaults stored in user-specified locations
  # Uses Flatpak for sandboxing and automatic updates
  services.flatpak.packages = [
    "md.obsidian.Obsidian"
    # "org.gnome.Notes"          # GNOME Notes - Simple note-taking
    # "com.logseq.Logseq"        # Logseq - Privacy-first knowledge base
  ];
}
