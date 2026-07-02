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
  ];

  imports = yutsuLib.scanPaths ./.;
}
