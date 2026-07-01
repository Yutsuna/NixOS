{
  claude-code-nix,
  vars,
  self,
  ...
}:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit claude-code-nix vars self; };
    users.${vars.user.name} = import ./User.nix;
    backupFileExtension = "backup";
  };
}
