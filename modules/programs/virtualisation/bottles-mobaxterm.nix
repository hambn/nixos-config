{ pkgs, ... }:

let
  # Helper script to download and setup MobaXterm for Bottles
  install-mobaxterm = pkgs.writeShellScriptBin "bottles-install-mobaxterm" ''
    #!/usr/bin/env bash
    set -e

    DOWNLOAD_DIR="$HOME/.local/share/bottles-installers/mobaxterm"
    MOBAXTERM_URL="https://download.mobatek.net/2432023122823706/MobaXterm_Installer_v24.3.zip"

    echo "╔════════════════════════════════════════════╗"
    echo "║  MobaXterm for Bottles - Auto Installer   ║"
    echo "╚════════════════════════════════════════════╝"
    echo ""

    # Create download directory
    mkdir -p "$DOWNLOAD_DIR"
    cd "$DOWNLOAD_DIR"

    # Check if already downloaded
    if [ -f "MobaXterm_Installer.zip" ]; then
      echo "✓ Installer already downloaded"
    else
      echo "→ Downloading MobaXterm installer..."
      ${pkgs.wget}/bin/wget -O MobaXterm_Installer.zip "$MOBAXTERM_URL" || {
        echo "✗ Download failed. Trying alternative method..."
        ${pkgs.curl}/bin/curl -L -o MobaXterm_Installer.zip "$MOBAXTERM_URL"
      }
      echo "✓ Download complete"
    fi

    # Extract installer
    echo "→ Extracting installer..."
    ${pkgs.unzip}/bin/unzip -o MobaXterm_Installer.zip
    echo "✓ Extraction complete"

    # Find the installer executable
    INSTALLER=$(find "$DOWNLOAD_DIR" -name "*.msi" -o -name "*installer*.exe" | head -1)

    echo ""
    echo "╔════════════════════════════════════════════╗"
    echo "║            Installation Ready              ║"
    echo "╚════════════════════════════════════════════╝"
    echo ""
    echo "Installer location: $INSTALLER"
    echo ""
    echo "Next steps:"
    echo "  1. Open Bottles application"
    echo "  2. Create a new bottle or select existing"
    echo "  3. Click 'Run Executable'"
    echo "  4. Navigate to: $DOWNLOAD_DIR"
    echo "  5. Select the installer file"
    echo "  6. Complete the installation wizard"
    echo ""
    echo "Quick launch: bottles -e \"$INSTALLER\""
    echo ""

    # Optional: Automatically open in Bottles if available
    if command -v bottles &> /dev/null; then
      read -p "Open installer in Bottles now? (y/N): " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        bottles -e "$INSTALLER"
      fi
    fi
  '';

in {
  # Install the helper script and dependencies
  environment.systemPackages = with pkgs; [
    install-mobaxterm
    wget              # For downloading
    curl              # Backup download method
    unzip             # For extracting installers
  ];

  # MobaXterm Auto-Installer for Bottles
  #
  # This module provides an automated setup script for installing
  # MobaXterm (a Windows SSH/X11 client) in Bottles.
  #
  # Usage:
  #   1. Run: bottles-install-mobaxterm
  #   2. Follow the on-screen prompts
  #   3. The script will download, extract, and prepare the installer
  #   4. Install through Bottles GUI or use the quick launch command
  #
  # After installation, MobaXterm will be available in:
  #   Bottles > Your Bottle Name > Programs > MobaXterm
}
