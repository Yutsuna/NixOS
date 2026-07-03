{
  pkgs,
  yutsuLib,
  ...
}:

{

  home.packages = with pkgs; [
    wl-clipboard
    wttrbar
    pavucontrol
    brightnessctl
  ];

  imports = yutsuLib.scanPaths ./.;
}
