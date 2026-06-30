{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11.0;
    };

    settings = {
      shell = "zsh";

      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      wheel_scroll_min_lines = 1;
      window_padding_width = 4;
      cursor_tail = 1;
      allow_hyperlinks = true;

      disable_ligatures = "never";

      gaps_in = "3";
      gaps_out = "8";
      border_size = "2";
      active_border = "rgba(eb6f92ff) rgba(c4a7e7ff) 45deg";
      inactive_border = "rgba(31748fcc) rgba(9ccfd8cc) 45deg";
      layout = "dwindle";
      resize_on_border = "true";

      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";

      background_opacity = "0.85";

      foreground = "#c6d0f5";
      background = "#303446";
      selection_foreground = "#303446";
      selection_background = "#f2d5cf";

      cursor = "#f2d5cf";
      cursor_text_color = "#303446";

      scrollbar_handle_color = "#949cbb";
      scrollbar_track_color = "#51576d";

      url_color = "#f2d5cf";

      active_border_color = "#babbf1";
      inactive_border_color = "#737994";
      bell_border_color = "#e5c890";

      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      active_tab_foreground = "#232634";
      active_tab_background = "#ca9ee6";
      inactive_tab_foreground = "#c6d0f5";
      inactive_tab_background = "#292c3c";
      tab_bar_background = "#232634";

      mark1_foreground = "#303446";
      mark1_background = "#babbf1";
      mark2_foreground = "#303446";
      mark2_background = "#ca9ee6";
      mark3_foreground = "#303446";
      mark3_background = "#85c1dc";

      color0 = "#51576d";
      color8 = "#626880";

      color1 = "#e78284";
      color9 = "#e78284";

      color2 = "#a6d189";
      color10 = "#a6d189";

      color3 = "#e5c890";
      color11 = "#e5c890";

      color4 = "#8caaee";
      color12 = "#8caaee";

      color5 = "#f4b8e4";
      color13 = "#f4b8e4";

      color6 = "#81c8be";
      color14 = "#81c8be";

      color7 = "#b5bfe2";
      color15 = "#a5adce";
    };

    extraConfig = ''
      font_features JetBrainsMonoNerdFont-Regular +calt +liga +kern
      font_features JetBrainsMonoNerdFont-Bold +calt +liga +kern
      font_features JetBrainsMonoNerdFont-Italic +calt +liga +kern
      font_features JetBrainsMonoNerdFont-BoldItalic +calt +liga +kern
      font_features JetBrainsMonoNerdFont-ExtraBold +calt +liga +kern
      font_features JetBrainsMonoNerdFont-ExtraBoldItalic +calt +liga +kern
      font_features JetBrainsMonoNerdFont-Medium +calt +liga +kern
      font_features JetBrainsMonoNerdFont-MediumItalic +calt +liga +kern
      font_features JetBrainsMonoNerdFont-SemiBold +calt +liga +kern
      font_features JetBrainsMonoNerdFont-SemiBoldItalic +calt +liga +kern
      font_features JetBrainsMonoNerdFont-Thin +calt +liga +kern
      font_features JetBrainsMonoNerdFont-ThinItalic +calt +liga +kern
      font_features JetBrainsMonoNerdFont-Light +calt +liga +kern
      font_features JetBrainsMonoNerdFont-LightItalic +calt +liga +kern
      font_features JetBrainsMonoNerdFont-ExtraLight +calt +liga +kern
      font_features JetBrainsMonoNerdFont-ExtraLightItalic +calt +liga +kern
    '';

    shellIntegration.enableZshIntegration = true;
  };
}
