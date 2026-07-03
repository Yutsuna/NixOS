{
  vars,
  ...
}:

let

  shellAliases = import ./Aliases.nix { inherit vars; };

in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "docker"
        "z"
        "vi-mode"
        "command-not-found"
      ];
    };

    shellAliases = shellAliases // {
      open = "xdg-open";
    };

    initContent = builtins.readFile ./config.zsh;
  };
}
