{ pkgs, ... }: {
  # GNU Binutils - Collection of binary tools
  # Includes: ld (linker), as (assembler), ar (archiver), nm, objdump, strip, etc.
  # Essential for compiling and linking programs
  environment.systemPackages = [ pkgs.binutils ];
}
