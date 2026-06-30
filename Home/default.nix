{ claude-code-nix, vars, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit claude-code-nix vars; };
    users.${vars.user.name} = import ./User.nix;
    backupFileExtension = "backup";
  };
}
