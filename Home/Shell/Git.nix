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
      open = "!git config --get remote.origin.url | sed -E -e 's/git@([^:]+):/https:\\/\\/\\1\\//' -e 's/\\.git$//' | xargs xdg-open 2>/dev/null || git config --get remote.origin.url | sed -E -e 's/git@([^:]+):/https:\\/\\/\\1\\//' -e 's/\\.git$//' | xargs open&";
    };
  };
}
