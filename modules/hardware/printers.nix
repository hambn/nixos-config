{ ... }: {
  # Enable CUPS to print documents
  services.printing.enable = true;

  # Printer drivers (uncomment as needed)
  # services.printing.drivers = with pkgs; [
  #   gutenprint
  #   hplip
  # ];
}
