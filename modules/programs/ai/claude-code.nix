# modules/programs/devops/claude-code.nix
{ pkgs, ... }:

let
  # Wrapper that uses npm to install/run latest claude-code
  # Impure but always gets latest version
  claude-code-wrapper = pkgs.writeShellScriptBin "claude" ''
    export NPM_CONFIG_PREFIX="$HOME/.npm-global"
    export PATH="$NPM_CONFIG_PREFIX/bin:${pkgs.nodejs}/bin:$PATH"
    
    # Install/update if not present or older than 1 day
    MARKER="$NPM_CONFIG_PREFIX/.claude-code-updated"
    if [ ! -f "$MARKER" ] || [ $(find "$MARKER" -mtime +1 2>/dev/null) ]; then
      echo "Checking for claude-code updates..." >&2
      npm install -g @anthropic-ai/claude-code@latest --silent 2>/dev/null
      touch "$MARKER"
    fi
    
    exec "$NPM_CONFIG_PREFIX/bin/claude" "$@"
  '';
in
{
  # Claude Code - AI coding assistant by Anthropic
  # Auto-updates via npm (checks daily)
  environment.systemPackages = [ 
    claude-code-wrapper
  ];
}