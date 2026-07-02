{
  self,
  pkgs,
  ...
}:
let
  launcher = import ./Launcher.nix { inherit pkgs self; };
in
{
  home.packages = [ launcher ];

  programs.wlogout = {
    enable = true;
    layout = import ./Layout.nix;
  };
}
