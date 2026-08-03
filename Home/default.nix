{
  self,
  vars,
  yutsuLib,
  llm-agents,
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
        llm-agents
        ;
    };
    users.${vars.user.name} = import ./User.nix;
    backupFileExtension = "backup";
  };
}
