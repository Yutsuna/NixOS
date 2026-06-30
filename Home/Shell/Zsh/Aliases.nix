{

  gs = "git status";

  copy = "wl-copy";
  paste = "wl-paste";

  nrb = "cd ~/NixOS;git add -A;sudo nixos-rebuild switch --flake ~/NixOS/#NixOS";

  sopsedit = "sudo sh -c 'SOPS_AGE_KEY=$(ssh-to-age -private-key -i /etc/ssh/ssh_host_ed25519_key 2>/dev/null) sops ~/NixOS/Secrets/Secrets.yaml'";

}
