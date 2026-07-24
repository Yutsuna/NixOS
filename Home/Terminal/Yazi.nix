{
  pkgs,
  ...
}:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };
  };

  home.packages = with pkgs; [
    ffmpegthumbnailer
    poppler
    fontforge
    imagemagick
    chafa
    zoxide
  ];

}
