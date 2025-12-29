{ pkgs, ... }: {
  # CMake - Cross-platform build system generator
  # Generates native makefiles and workspaces for various build systems
  # Widely used for C/C++ projects
  environment.systemPackages = [ pkgs.cmake ];
}
