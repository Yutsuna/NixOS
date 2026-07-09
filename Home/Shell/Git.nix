{ vars, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = vars.user.name;
        email = vars.user.email;
      };
    };
    aliases = {
      cleanup = "!git fetch --prune && git branch -vv | awk '/: gone]/ {print $1}' | xargs -r git branch -d";
    };
  };
}
