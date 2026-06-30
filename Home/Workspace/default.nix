{
  pkgs,
  ...
}:

{

  home.packages = with pkgs; [
    wl-clipboard
    wttrbar
    pavucontrol
  ];

  imports = [
    ./Waybar
    ./Swaync
    ./Awww
  ];

}
