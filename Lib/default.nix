{ lib, ... }:

let
  autoImport = import ./AutoImport.nix { inherit lib; };
  make = import ./Make.nix { inherit lib; };
in
autoImport // make
