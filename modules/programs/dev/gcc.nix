{ pkgs, ... }: {
  # GCC - GNU Compiler Collection
  # Compilers for C, C++, and other languages
  # Note: For system-wide optimization flags, use:
  #   nixpkgs.hostPlatform.gcc.arch = "native";
  #   nixpkgs.hostPlatform.gcc.tune = "native";
  environment.systemPackages = [
    pkgs.gcc
    # pkgs.gcc13    # GCC 13
    # pkgs.gcc14    # GCC 14
  ];
}
