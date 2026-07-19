{
  pkgs ? import <nixpkgs> { }
}:
pkgs.mkShell {
  description = "Yutsuna's NixOS Development Shell";
  packages = with pkgs;[
    nil
    nixfmt

    statix
    deadnix

    nix-tree
    nix-init
  ];
}
