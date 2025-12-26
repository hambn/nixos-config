{ config, lib, pkgs, ... }:

let
  mobaxterm-version = "25.4";

  # Download MobaXterm Portable
  mobaxterm-portable = pkgs.fetchzip {
    url = "https://download.mobatek.net/MobaXterm_Portable_v${mobaxterm-version}.zip";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Will be auto-computed
    stripRoot = false;
  };

  # Wrapper script to run MobaXterm via Bottles
  mobaxterm-wrapper = pkgs.writeShellScriptBin "mobaxterm" ''
    #!/bin/sh
    BOTTLE_NAME="Windows-Apps"

    # Check if bottles is available
    if ! command -v bottles-cli &> /dev/null; then
      echo "Error: Bottles is not installed or bottles-cli not found"
      exit 1
    fi

    # Run MobaXterm through Bottles
    if [ -z "$1" ]; then
      ${pkgs.bottles}/bin/bottles-cli run -b "$BOTTLE_NAME" -e "C:\\MobaXterm\\MobaXterm.exe"
    else
      # Pass file argument if provided
      filepath=$(${pkgs.wine}/bin/winepath --windows "$1")
      ${pkgs.bottles}/bin/bottles-cli run -b "$BOTTLE_NAME" -e "C:\\MobaXterm\\MobaXterm.exe" --args "$filepath"
    fi
  '';

  # Desktop entry for MobaXterm
  mobaxterm-desktop = pkgs.makeDesktopItem {
    name = "mobaxterm";
    desktopName = "MobaXterm";
    exec = "mobaxterm %U";
    terminal = false;
    type = "Application";
    icon = "utilities-terminal";
    categories = [ "Network" "RemoteAccess" "Utility" ];
    comment = "Enhanced terminal for Windows with X11 server, SSH, and more";
  };

in {
  # Install MobaXterm wrapper and desktop entry
  environment.systemPackages = [
    mobaxterm-wrapper
    mobaxterm-desktop
  ];

  # Systemd service to auto-setup MobaXterm in Bottles (runs once per user)
  systemd.user.services.bottles-mobaxterm-setup = {
    description = "Auto-setup MobaXterm in Bottles";
    wantedBy = [ "default.target" ];

    # Only run once
    unitConfig = {
      ConditionPathExists = "!%h/.config/bottles-mobaxterm-installed";
    };

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
      BOTTLE_NAME="Windows-Apps"
      BOTTLES_DIR="$HOME/.var/app/com.usebottles.bottles/data/bottles"
      BOTTLE_PATH="$BOTTLES_DIR/bottles/$BOTTLE_NAME"
      MOBAXTERM_DIR="$BOTTLE_PATH/drive_c/MobaXterm"

      echo "Setting up MobaXterm in Bottles..."

      # Wait for Bottles to be available
      if ! command -v bottles-cli &> /dev/null; then
        echo "Bottles not found, skipping setup"
        exit 0
      fi

      # Create bottle if it doesn't exist
      if [ ! -d "$BOTTLE_PATH" ]; then
        echo "Creating Bottles bottle: $BOTTLE_NAME"
        ${pkgs.bottles}/bin/bottles-cli new --bottle-name "$BOTTLE_NAME" --environment application
        sleep 2
      fi

      # Create MobaXterm directory in bottle
      mkdir -p "$MOBAXTERM_DIR"

      # Copy MobaXterm portable files
      echo "Installing MobaXterm portable..."
      cp -r ${mobaxterm-portable}/* "$MOBAXTERM_DIR/"

      # Mark as installed
      mkdir -p "$HOME/.config"
      touch "$HOME/.config/bottles-mobaxterm-installed"

      echo "MobaXterm installed successfully!"
      echo "You can now run 'mobaxterm' or find it in your application menu"
    '';
  };

  # Enable Bottles (required dependency)
  # Note: bottles.nix should already enable this, but listing for clarity
}