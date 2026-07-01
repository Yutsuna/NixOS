{
  self,
  ...
}:
let
  layout = import ./Layout.nix;
  icons = "${self}/Assets/Wlogout";
  style = builtins.replaceStrings [ ''url("icons/'' ] [ ''url("${icons}/'' ] (
    builtins.readFile ./styles.scss
  );
in
{
  programs.wlogout = {
    enable = true;
    inherit layout style;
  };
}
