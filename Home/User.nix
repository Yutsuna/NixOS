{
  pkgs,
  vars,
  yutsuLib,
  ...
}:
{
  home = {
    username = vars.user.name;
    homeDirectory = vars.user.home;
  };

  programs = {
    home-manager.enable = true;
  };

  fonts.fontconfig.enable = true;

  imports = yutsuLib.scanPaths ./.;

  home.packages = with pkgs; [
    vim
  ];

  home.stateVersion = "26.05";
}
