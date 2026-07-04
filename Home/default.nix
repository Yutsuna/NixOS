{
  self,
  vars,
  yutsuLib,
  claude-code-nix,
  graphify,
  ...
}:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit
        self
        vars
        yutsuLib
        claude-code-nix
        graphify
        ;
    };
    users.${vars.user.name} = import ./User.nix;
    backupFileExtension = "backup";
  };
}
