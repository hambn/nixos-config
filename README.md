# NixOS Configuration

A modular, flake-based NixOS configuration with support for multiple hosts and users using Home Manager.

## Features

- **Flake-based configuration** with automatic module discovery
- **Multi-host support** with per-host configurations
- **Home Manager integration** for declarative user environments
- **Modular architecture** for easy customization and reuse
- **Multiple desktop environments** (GNOME, Hyprland, KDE Plasma)
- **Comprehensive inputs**:
  - NixOS unstable and stable channels
  - Hyprland compositor with Hyprlock
  - Stylix for system-wide theming
  - Emacs and Rust overlays
  - Chaotic Nyx repository
  - StevenBlack's host blocklist

## Hosts

This configuration manages the following systems:

- **bn-laptop** - Laptop with NVIDIA Optimus support
- **bn-pc** - Desktop PC

## Repository Structure

```
.
├── flake.nix                    # Main flake configuration
├── configuration.nix            # Legacy configuration (if needed)
├── hardware-configuration.nix   # Auto-generated hardware config
│
├── hosts/                       # Host-specific configurations
│   ├── bn-laptop/
│   │   ├── default.nix
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── bn-pc/
│       ├── default.nix
│       ├── configuration.nix
│       └── hardware-configuration.nix
│
├── modules/                     # Global reusable modules
│   ├── system/                  # System-level modules
│   │   └── nix/
│   │       └── settings.nix
│   └── user/                    # User-level modules
│       ├── browsers/
│       │   └── firefox.nix
│       ├── editors/
│       │   └── vim.nix
│       ├── shell-tools/
│       │   └── git.nix
│       ├── terminal/
│       │   └── htop.nix
│       ├── virtualisation/
│       │   ├── docker.nix
│       │   └── podman.nix
│       └── vpn/
│           └── flclash.nix
│
└── users/                       # User home-manager configurations
    ├── hambn/
    │   └── home.nix
    └── test/
        └── home.nix
```

## Installation

### Fresh Installation

1. **Clone this repository:**
   ```bash
   git clone https://github.com/yourusername/nixos-config.git /etc/nixos
   cd /etc/nixos
   ```

2. **Generate hardware configuration:**
   ```bash
   nixos-generate-config --show-hardware-config > hosts/YOUR_HOSTNAME/hardware-configuration.nix
   ```

3. **Create host configuration:**
   ```bash
   mkdir -p hosts/YOUR_HOSTNAME
   cp hosts/bn-laptop/default.nix hosts/YOUR_HOSTNAME/
   # Edit the configuration as needed
   ```

4. **Build and switch:**
   ```bash
   sudo nixos-rebuild switch --flake .#YOUR_HOSTNAME
   ```

### Updating an Existing System

```bash
# Update flake inputs
nix flake update

# Rebuild with new configuration
sudo nixos-rebuild switch --flake .#YOUR_HOSTNAME

# Or test before switching
sudo nixos-rebuild test --flake .#YOUR_HOSTNAME
```

## Module Organization

The configuration uses automatic module discovery:

- **Global modules** (`modules/`) are automatically imported for all hosts
- **Host-specific modules** (`hosts/HOST/modules/`) are imported only for that host
- **User configurations** (`users/USER/home.nix`) define Home Manager settings

### Adding a New Module

1. Create a `.nix` file in the appropriate directory under `modules/`
2. The module will be automatically discovered and imported
3. No need to manually add imports to `flake.nix`

### Adding a New User

1. Create a directory under `users/`:
   ```bash
   mkdir -p users/newuser
   ```

2. Create `users/newuser/home.nix`:
   ```nix
   { config, pkgs, ... }:
   {
     home.username = "newuser";
     home.homeDirectory = "/home/newuser";
     home.stateVersion = "25.11";

     # Add user-specific configuration
   }
   ```

3. Add the user to your host configuration
4. Rebuild the system

### Adding a New Host

1. Create host directory:
   ```bash
   mkdir -p hosts/newhost
   ```

2. Generate hardware configuration:
   ```bash
   nixos-generate-config --show-hardware-config > hosts/newhost/hardware-configuration.nix
   ```

3. Create `hosts/newhost/default.nix` and `configuration.nix`

4. Build:
   ```bash
   sudo nixos-rebuild switch --flake .#newhost
   ```

## Useful Commands

```bash
# Build and switch to new configuration
sudo nixos-rebuild switch --flake .#HOSTNAME

# Test configuration without switching
sudo nixos-rebuild test --flake .#HOSTNAME

# Build configuration (don't activate)
sudo nixos-rebuild build --flake .#HOSTNAME

# Update all flake inputs
nix flake update

# Update specific input
nix flake lock --update-input nixpkgs

# Check flake
nix flake check

# Show flake outputs
nix flake show

# Clean old generations
sudo nix-collect-garbage --delete-older-than 30d

# List generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
```

## Desktop Environments

This configuration supports multiple desktop environments:

- **GNOME** - Full-featured desktop environment
- **Hyprland** - Dynamic tiling Wayland compositor
- **KDE Plasma** - Feature-rich desktop with plasma-manager

## Hardware Support

- NVIDIA GPU with Optimus support (laptop configuration)
- PipeWire audio system
- Printing via CUPS
- NetworkManager for network connectivity

## License

This configuration is provided as-is for personal use and reference.

## Credits

- [NixOS](https://nixos.org/)
- [Home Manager](https://github.com/nix-community/home-manager)
- [Hyprland](https://hyprland.org/)
- [Stylix](https://github.com/danth/stylix)
