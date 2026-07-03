{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    config = {
      global = {
        log_format = "";
      };
    };
  };

  home.sessionVariables = {
    DIRENV_LOG_FORMAT = "";
  };
}
