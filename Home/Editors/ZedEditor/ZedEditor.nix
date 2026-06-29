{ pkgs, ... }:

let
  ai = import ./Ai.nix;
  lsp = import ./Lsp.nix;
  terminal = import ./Terminal.nix;
  settings = import ./Settings.nix;
  extensions = import ./Extensions.nix;

  finalSettings =
    settings
    // ai
    // {
      inherit lsp terminal;
    };
in
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    mutableUserSettings = false;

    inherit extensions;

    userSettings = finalSettings;

    extraPackages = [
      pkgs.nil
      pkgs.nixd
    ];
  };
}
