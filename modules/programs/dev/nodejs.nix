{ pkgs, ... }: {
  # Node.js - JavaScript runtime built on V8 engine
  # Includes npm package manager for installing JavaScript packages
  # Global packages: npm install -g [package]
  # Configuration: ~/.npmrc, ~/.npm-global/
  environment.systemPackages = [
    pkgs.nodejs
    # pkgs.nodejs_20    # LTS version (more stable)
    # pkgs.nodejs_22    # Current version
  ];
}