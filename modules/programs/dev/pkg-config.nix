{ pkgs, ... }: {
  # pkg-config - Helper tool for compiling applications and libraries
  # Provides the correct compiler/linker flags for installed libraries
  # Essential for finding library dependencies during compilation
  environment.systemPackages = [ pkgs.pkg-config ];
}
