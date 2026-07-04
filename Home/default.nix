{
  self,
  vars,
  yutsuLib,
  llm-agents,
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
        llm-agents
        graphify
        ;
    };
    users.${vars.user.name} = import ./User.nix;
    backupFileExtension = "backup";
  };
}
