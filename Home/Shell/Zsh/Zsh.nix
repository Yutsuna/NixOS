{
  vars,
  yutsuLib,
  ...
}:

let

  shellAliases = import ./Aliases.nix { inherit vars; };
  baseZshConfig = builtins.readFile ./config.zsh;

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
    inherit shellAliases;

    initContent = ''
      ${baseZshConfig}
      ${yutsuLib.mkSecretEnv "MISTRAL_API_KEY"}
    '';
    # initContent = baseZshConfig // (yutsuLib.mkSecretEnv "MISTRAL_API_KEY");
  };
}
