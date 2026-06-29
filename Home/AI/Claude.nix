{ claude-code-nix
, pkgs
, ...
}:

{

  home.packages = [
    claude-code-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
