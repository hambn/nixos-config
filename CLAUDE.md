# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build and Deploy Commands

```bash
# Build and switch to new configuration (replace HOSTNAME with bn-laptop or bn-pc)
sudo nixos-rebuild switch --flake .#HOSTNAME

# Test configuration without switching (recommended before switch)
sudo nixos-rebuild test --flake .#HOSTNAME

# Check flake for errors
nix flake check

# Update all flake inputs
nix flake update

# Update specific input
nix flake lock --update-input nixpkgs
```

## Configuration Philosophy

**Prefer portable dotfiles over Nix-managed configs.** If something can be handled in normal dotfiles (`.bashrc`, `.vimrc`, etc.), it should be - this allows the same configs to work across any distro. Use Nix modules only for NixOS-specific things (services, packages, system settings). User dotfiles will be in a separate repository.

## Architecture

This is a NixOS flake-based configuration with **automatic module discovery**. The flake.nix contains a `findNixFiles` function that recursively discovers all `.nix` files under `modules/`, eliminating the need for manual imports.

### Key Directories

- **`hosts/`** - Host-specific configurations. Each host has `default.nix`, `configuration.nix`, and `hardware-configuration.nix`. Host-specific modules go in `hosts/HOSTNAME/modules/`.
- **`modules/`** - Global modules auto-imported for all hosts. Organized by category: `desktop/`, `hardware/`, `nix/`, `programs/`, `system/`.
- **`users/`** - Home Manager configurations per user (e.g., `users/hambn/home.nix`).

### Hosts

- **bn-laptop** - Laptop with NVIDIA Optimus (Prime offload mode)
- **bn-pc** - Desktop PC

### Module Pattern

Modules follow a simple structure:
```nix
{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.package-name ];
}
```

For services:
```nix
{ ... }: {
  services.servicename.enable = true;
}
```

### Adding New Modules

Create a `.nix` file anywhere under `modules/` - it will be automatically discovered and imported. No need to modify flake.nix.

Example: Create `modules/programs/tools/newtool.nix`:
```nix
{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.newtool ];
}
```

### Special Args Available

All modules receive `inputs` and `host` as special arguments from the flake.

## Git Workflow

- **main** - Production branch (PRs go here)
- **dev** - Development branch
- Use `claude/*` prefix for feature branches
- Semantic commits: `feat:`, `fix:`, `refactor:`, `docs:`

## Key Flake Inputs

- nixpkgs (unstable) and nixpkgs-stable (25.11)
- Home Manager
- nix-flatpak (declarative Flatpak management)
- Hyprland, Plasma Manager, Stylix (theming)
- chaotic-nyx (AUR packages for NixOS)
