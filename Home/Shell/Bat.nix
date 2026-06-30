{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin Frappe";
    };
    themes = {
      "Catppuccin Frappe" = {
        src = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/catppuccin/bat/refs/heads/main/themes/Catppuccin%20Frappe.tmTheme";
          sha256 = "sha256-NEbYo8+561Wbxlo4lOaujzV5Aw+sYTDE+W/1JPPieE8=";
        };
      };
    };
  };

  home.shellAliases = {
    cat = "bat";
  };
}
