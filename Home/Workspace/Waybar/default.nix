{ pkgs, vars, ... }:
let

  settings = [ (import ./Settings.nix { inherit vars; }) ];
  style = builtins.readFile ./styles.scss;
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd.enable = true;

    inherit settings;
    inherit style;
  };
}
