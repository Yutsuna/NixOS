{

  gs = "git status";

  ls = "eza --icons always";
  ll = "eza --icons always -bhl --group-directories-first";
  la = "eza --icons always -abhl --group-directories-first";
  tree = "eza --icons always --tree";

  copy = "wl-copy";
  paste = "wl-paste";

  nrb = "cd ~/NixOS;git add -A;sudo nixos-rebuild switch --flake ~/NixOS/#NixOS";

  sopsedit = "sudo sh -c 'SOPS_AGE_KEY=$(ssh-to-age -private-key -i /etc/ssh/ssh_host_ed25519_key 2>/dev/null) sops ~/NixOS/Secrets/Secrets.yaml'";

}
