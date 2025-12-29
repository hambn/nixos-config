# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Philosophy

**Prefer portable dotfiles over Nix-managed configs.** If something can be handled in normal dotfiles (`.bashrc`, `.vimrc`, etc.), it should be - this allows the same configs to work across any distro. Use Nix modules only for:
- Installing packages
- NixOS-specific services
- System settings that can't be in dotfiles

User dotfiles will be in a separate repository.

## Commands

```bash
# Build and switch (bn-laptop or bn-pc)
sudo nixos-rebuild switch --flake .#bn-laptop

# Test without switching
sudo nixos-rebuild test --flake .#bn-laptop

# Check flake for errors
nix flake check

# Update all inputs
nix flake update
```

## Architecture

NixOS flake with **automatic module discovery** - the `findNixFiles` function in flake.nix recursively finds all `.nix` files under `modules/`. No manual imports needed.

### Directory Structure

```
├── hosts/
│   ├── bn-laptop/          # Laptop (NVIDIA Optimus)
│   │   ├── default.nix
│   │   ├── configuration.nix
│   │   ├── hardware-configuration.nix
│   │   └── modules/        # Host-specific modules
│   └── bn-pc/              # Desktop PC
│
├── modules/                # Auto-imported for all hosts
│   ├── desktop/            # GNOME, xserver, fonts
│   ├── hardware/           # audio, bluetooth, printers
│   ├── nix/                # nix settings, gc, optimization
│   ├── programs/           # All applications (see below)
│   └── system/             # boot, locale, networking, users
│
└── users/                  # Home Manager configs
    └── hambn/home.nix
```

### Programs Structure

```
modules/programs/
├── ai/              # claude-code (custom npm wrapper)
├── browsers/        # firefox, chrome
├── dev/             # gcc, make, cmake, nodejs, etc.
├── devops/          # git
├── editors/         # vim, nvim, nano, vscode
├── networking/      # curl, wget, nmap, ssh, sshfs, etc.
├── shell/           # bash, zsh
├── terminals/       # alacritty, kitty
├── utils/           # htop, jq, grep, sed, tar, zip, etc.
└── virtualisation/  # bottles (flatpak)
```

## Module Patterns

### Simple package
```nix
{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.package-name ];
}
```

### Flatpak package
```nix
{ pkgs, ... }: {
  services.flatpak.packages = [ "com.example.app" ];
}
```

### Program with options
```nix
{ ... }: {
  programs.git = {
    enable = true;
    config.color.ui = "auto";
  };
}
```

### Service
```nix
{ ... }: {
  services.openssh.enable = true;
}
```

## Adding New Modules

Create a `.nix` file anywhere under `modules/` - automatically discovered.

**One file per app** - allows app-specific Nix options and custom install logic (like claude-code's npm wrapper).

## Special Args

All modules receive `inputs` and `host` from flake.

## Git Workflow

- **main** - Production (PRs target here)
- **dev** - Development
- Prefix: `claude/*` for feature branches
- Commits: `feat:`, `fix:`, `refactor:`, `docs:`

## Key Inputs

- nixpkgs (unstable) + nixpkgs-stable
- Home Manager
- nix-flatpak (declarative Flatpak)
- Hyprland, Plasma Manager, Stylix
