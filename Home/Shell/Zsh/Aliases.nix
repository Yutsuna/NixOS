{
  gs = "git status";

  copy = "wl-copy";
  paste = "wl-paste";

  nrb = "cd ~/NixOS;git add -A;sudo nixos-rebuild switch --flake ~/NixOS/#NixOS";
  nd = "nix develop path:.";
}
