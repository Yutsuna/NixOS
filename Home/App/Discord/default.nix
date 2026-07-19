{
  pkgs,
  ...
}:
let
  catppuccinTheme = with builtins; readFile( fetchurl{
    url = "https://catppuccin.github.io/discord/dist/catppuccin-frappe.theme.css";
    sha256 = "0g0f0hdny65wva328syb9bsqcf3667bi1yl7gw0hinhpbwzwgmkm";
  } );
in
{
  home = {
    packages = with pkgs; [
    vesktop
  ];
  file.".config/vesktop/settings/quickCss.css".text = catppuccinTheme;
  };
}
