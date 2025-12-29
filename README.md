# NixOS Configuration

My personal NixOS setup using Nix Flakes. It supports multiple computers and users.

## What's Inside

- **Flake-based** - Modern Nix with automatic module discovery
- **Multi-host** - One config for multiple computers (laptop, desktop)
- **Home Manager** - Manage user settings declaratively
- **Modular** - One file per program, easy to add or remove
- **Portable dotfiles** - Config files work on any Linux distro

## Quick Start

```bash
# Build and apply (replace HOSTNAME with bn-laptop or bn-pc)
sudo nixos-rebuild switch --flake .#HOSTNAME

# Test without applying
sudo nixos-rebuild test --flake .#HOSTNAME

# Update all packages
nix flake update

# Check for errors
nix flake check
```

## Hosts

| Host | Description |
|------|-------------|
| **bn-laptop** | Laptop with NVIDIA Optimus graphics |
| **bn-pc** | Desktop PC |

## Directory Structure

```
.
├── flake.nix                 # Main config (inputs, hosts, auto-discovery)
│
├── hosts/                    # Computer-specific configs
│   ├── bn-laptop/
│   │   ├── default.nix
│   │   ├── configuration.nix
│   │   ├── hardware-configuration.nix
│   │   └── modules/
│   │       └── nvidia.nix    # Laptop-only NVIDIA setup
│   └── bn-pc/
│       ├── default.nix
│       ├── configuration.nix
│       └── hardware-configuration.nix
│
├── modules/                  # Shared modules (auto-imported)
│   ├── desktop/              # Desktop environment
│   │   ├── gnome.nix
│   │   ├── xserver.nix
│   │   └── fonts.nix
│   │
│   ├── hardware/             # Hardware support
│   │   ├── audio.nix         # PipeWire audio
│   │   ├── bluetooth.nix
│   │   └── printers.nix      # CUPS printing
│   │
│   ├── nix/                  # Nix settings
│   │   ├── settings.nix
│   │   ├── gc.nix            # Garbage collection
│   │   └── optimization.nix
│   │
│   ├── system/               # System settings
│   │   ├── boot.nix
│   │   ├── locale.nix
│   │   ├── networking.nix
│   │   └── users.nix
│   │
│   └── programs/             # All applications
│       ├── ai/
│       │   └── claude-code.nix
│       ├── browsers/
│       │   ├── firefox.nix
│       │   └── chrome.nix
│       ├── dev/
│       │   ├── gcc.nix
│       │   ├── cmake.nix
│       │   ├── make.nix
│       │   ├── nodejs.nix
│       │   ├── binutils.nix
│       │   └── pkg-config.nix
│       ├── devops/
│       │   └── git.nix
│       ├── editors/
│       │   ├── vim.nix
│       │   ├── nvim.nix
│       │   ├── nano.nix
│       │   └── vscode.nix
│       ├── networking/
│       │   ├── curl.nix
│       │   ├── wget.nix
│       │   ├── openssh.nix
│       │   ├── ssh.nix
│       │   ├── sshfs.nix
│       │   ├── sshpass.nix
│       │   ├── nmap.nix
│       │   ├── mtr.nix
│       │   ├── tcpdump.nix
│       │   ├── traceroute.nix
│       │   ├── iperf.nix
│       │   ├── bind.nix
│       │   ├── whois.nix
│       │   ├── flclash.nix
│       │   ├── net-tools.nix
│       │   ├── iputils.nix
│       │   └── iproute2.nix
│       ├── pkgmanager/
│       │   └── flatpak.nix
│       ├── shell/
│       │   ├── bash.nix
│       │   └── zsh.nix
│       ├── terminals/
│       │   ├── alacritty.nix
│       │   └── kitty.nix
│       ├── utils/
│       │   ├── htop.nix
│       │   ├── btop.nix
│       │   ├── iotop.nix
│       │   ├── jq.nix
│       │   ├── yq.nix
│       │   ├── grep.nix
│       │   ├── sed.nix
│       │   ├── awk.nix
│       │   ├── tar.nix
│       │   ├── gzip.nix
│       │   ├── zip.nix
│       │   ├── unzip.nix
│       │   ├── p7zip.nix
│       │   ├── tree.nix
│       │   ├── time.nix
│       │   ├── watch.nix
│       │   ├── which.nix
│       │   └── xmlstarlet.nix
│       └── virtualisation/
│           ├── docker.nix
│           ├── podman.nix
│           └── bottles.nix
│
└── users/                    # User configs (Home Manager)
    ├── hambn/
    │   └── home.nix
    └── test/
        └── home.nix
```

## How It Works

### Auto-Discovery

All `.nix` files in `modules/` are automatically found and loaded. No need to edit `flake.nix` when adding new modules.

### Adding a New Program

1. Create a file in the right folder:
   ```bash
   touch modules/programs/editors/emacs.nix
   ```

2. Add your config:
   ```nix
   { pkgs, ... }: {
     # Emacs - Extensible text editor
     # Configuration: ~/.emacs.d/
     environment.systemPackages = [ pkgs.emacs ];
   }
   ```

3. Rebuild:
   ```bash
   sudo nixos-rebuild switch --flake .#HOSTNAME
   ```

### Adding a New Host

1. Create host folder:
   ```bash
   mkdir -p hosts/newhost
   ```

2. Generate hardware config:
   ```bash
   nixos-generate-config --show-hardware-config > hosts/newhost/hardware-configuration.nix
   ```

3. Copy and edit default.nix and configuration.nix from existing host

4. Build:
   ```bash
   sudo nixos-rebuild switch --flake .#newhost
   ```

### Adding a New User

1. Create user folder:
   ```bash
   mkdir -p users/newuser
   ```

2. Create `users/newuser/home.nix`:
   ```nix
   { config, pkgs, ... }: {
     home.username = "newuser";
     home.homeDirectory = "/home/newuser";
     home.stateVersion = "24.11";
   }
   ```

3. Add user to `modules/system/users.nix`

4. Rebuild

## Flake Inputs

| Input | What it does |
|-------|--------------|
| **nixpkgs** | Main packages (unstable) |
| **home-manager** | User environment management |
| **nix-flatpak** | Declarative Flatpak packages |
| **hyprland** | Tiling Wayland compositor (for later) |
| **hyprlock** | Screen locker for Hyprland (for later) |

## Useful Commands

```bash
# Rebuild and switch
sudo nixos-rebuild switch --flake .#HOSTNAME

# Test without switching
sudo nixos-rebuild test --flake .#HOSTNAME

# Build only (no activation)
sudo nixos-rebuild build --flake .#HOSTNAME

# Update all inputs
nix flake update

# Update one input
nix flake lock --update-input nixpkgs

# Check flake syntax
nix flake check

# Show what's in the flake
nix flake show

# Clean old generations (keep last 30 days)
sudo nix-collect-garbage --delete-older-than 30d

# List all generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Rollback to previous generation
sudo nixos-rebuild switch --rollback
```

## Config Philosophy

1. **Portable dotfiles** - If it can be in `~/.config/`, it should be. This way configs work on any Linux.

2. **Nix for system stuff** - Use Nix only for:
   - Installing packages
   - NixOS services
   - System settings that can't be in dotfiles

3. **One file per app** - Each program gets its own `.nix` file with:
   - Description comment
   - Config file location
   - Available options as comments

## Hardware Support

- **NVIDIA Optimus** - Hybrid graphics on laptop
- **PipeWire** - Modern audio system
- **CUPS** - Printing support
- **Bluetooth** - Wireless devices
- **NetworkManager** - Network management

## Desktop Environments

- **GNOME** - Full desktop environment
- **Hyprland** - Tiling Wayland compositor
- **KDE Plasma** - Feature-rich desktop (via plasma-manager)

## Credits

- [NixOS](https://nixos.org/)
- [Home Manager](https://github.com/nix-community/home-manager)
- [nix-flatpak](https://github.com/gmodena/nix-flatpak)
- [Hyprland](https://hyprland.org/)
- [Stylix](https://github.com/danth/stylix)
