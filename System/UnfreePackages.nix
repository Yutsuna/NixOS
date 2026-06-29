{ lib, ... }:

{

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "claude"
    "discord"
    "spotify"
    "zed-editor"
  ];

}
