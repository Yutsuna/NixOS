{ pkgs, ... }:

{
  programs.zed-editor = with pkgs; {
    enable = true;
    extraPackages = [
      nil
      nixd
    ];
  };
}
