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

    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
      # ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      QT_QPA_PLATFORM = "wayland;xcb";
      # GDK_BACKEND = "wayland,x11";
      SDL_VIDEODRIVER = "wayland";
      # _JAVA_AWT_WM_NONREPARENTING = "1";
    };

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
