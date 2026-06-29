{ config
  , pkgs
  , vars
  , ...
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
    ./Hyprland/Hyprland.nix
    ./Editors/ZedEditor/ZedEditor.nix
    ./Shell/Zsh.nix
    ./Shell/Git.nix
    ./Terminal
    ./AI
    ./Workspace
  ];

  home.packages = with pkgs; [
    vim
    eza
    wl-clipboard
  ];

  home.stateVersion = "26.05";
}
