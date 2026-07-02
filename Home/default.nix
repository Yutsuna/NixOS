{
  claude-code-nix,
  vars,
  self,
  yutsuLib,
  ...
}:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit
        claude-code-nix
        vars
        self
        yutsuLib
        ;
    };
    users.${vars.user.name} = import ./User.nix;
    backupFileExtension = "backup";
  };
}
