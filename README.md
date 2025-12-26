```
modules/
├── hardware/
│   ├── nvidia.nix
│   ├── bluetooth.nix
│   ├── audio.nix
│   └── printers.nix
├── system/
│   ├── boot.nix
│   ├── locale.nix
│   ├── networking.nix
│   └── users.nix
├── nix/
│   ├── settings.nix
│   ├── gc.nix
│   └── optimization.nix
├── desktop/
│   ├── gnome.nix
│   ├── xserver.nix
│   └── fonts.nix
└── apps/
    ├── editors/
    │   ├── vim.nix
    │   ├── nvim.nix
    │   └── vscode.nix
    ├── browsers/
    │   ├── firefox.nix
    │   └── chrome.nix
    ├── terminals/
    │   ├── alacritty.nix
    │   └── kitty.nix
    ├── shell/
    │   ├── zsh.nix
    │   └── bash.nix
    ├── containers/
    │   ├── docker.nix      # package + service config
    │   └── podman.nix
    └── tools/
        ├── git.nix
        ├── htop.nix
        └── ssh.nix         # package + service config
```