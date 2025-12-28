{ pkgs, ... }: {
  # GNU Make - Build automation tool
  # Automatically builds executable programs and libraries from source code
  # Reads Makefiles to determine how to build targets
  environment.systemPackages = [ pkgs.gnumake ];
}
