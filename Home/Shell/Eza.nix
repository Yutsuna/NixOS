{ pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg.configFile."eza/theme.yml".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/eza/refs/heads/main/themes/frappe/catppuccin-frappe-lavender.yml";
    sha256 = "sha256-MLdjZsJjaCQJPqC9YmM/ff/Tfx1ZKTaMrbxFPoNhMdI="; # Laissez Nix vous donner le bon hash au build
  };

  home.shellAliases = {
    ls = "eza --icons always";
    ll = "eza --icons always -bhl --group-directories-first";
    la = "eza --icons always -abhl --group-directories-first";
    tree = "eza --icons always --tree";
  };
}
