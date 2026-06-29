{

  gs = "git status";

  ls = "eza --icons always";
  ll = "eza --icons always -bhl --group-directories-first";
  la = "eza --icons always -abhl --group-directories-first";
  tree = "eza --icons always --tree";

  copy = "wl-copy";
  paste = "wl-paste";

  nrb = "cd ~/NixOS;git add -A;sudo nixos-rebuild switch --flake ~/NixOS/#NixOS";
}
