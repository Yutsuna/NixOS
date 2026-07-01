{ pkgs, vars, ... }:
let

  settings = [ (import ./Settings.nix { inherit pkgs vars; }) ];
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
