{
  vars,
  ...
}:
{
  gs = "git status";

  copy = "wl-copy";
  paste = "wl-paste";

  nrb = "cd ~/NixOS;git add -A;sudo nixos-rebuild switch --flake ~/NixOS/#NixOS";
  nd = "nix develop path:.";

  sopsedit = "sudo sh -c 'SOPS_AGE_KEY=$(ssh-to-age -private-key -i /etc/ssh/ssh_host_ed25519_key 2>/dev/null) sops /home/${vars.user.name}/NixOS/Secrets/Secrets.yaml'";

  open = "xdg-open";
}
