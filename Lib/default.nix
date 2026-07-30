{ lib, ... }:

let
  scan = import ./Scan.nix { inherit lib; };
  make = import ./Make.nix { inherit lib; };
in
scan // make
