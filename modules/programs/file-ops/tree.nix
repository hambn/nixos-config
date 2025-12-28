{ pkgs, ... }: {
  # tree - Display directory structure in tree format
  # Shows files and directories in a hierarchical tree view
  # Useful for visualizing directory structures
  # Usage: tree [directory]
  environment.systemPackages = [ pkgs.tree ];
}
