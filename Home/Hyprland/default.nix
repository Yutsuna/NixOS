{

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    extraConfig = builtins.readFile ./init.lua;
  };

  xdg.configFile = {
    "hypr/settings.lua".source = ./settings.lua;
    "hypr/binds.lua".source = ./binds.lua;
    "hypr/window.lua".source = ./window.lua;
  };

}
