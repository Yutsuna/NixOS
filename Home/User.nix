{
  pkgs,
  vars,
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

  imports = [
    ./Hyprland
    ./Editors
    ./Shell
    ./Terminal
    ./AI
    ./Workspace
    ./Browser
  ];

  home.packages = with pkgs; [
    vim
    wl-clipboard
  ];

  home.stateVersion = "26.05";
}
