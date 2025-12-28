{ pkgs, ... }: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "claude-code" ''
      ${pkgs.nodejs}/bin/npx @anthropic-ai/claude-code "$@"
    '')
  ];
}