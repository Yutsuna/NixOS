{
  yutsuLib,
  ...
}:
let
  toXdgConfig = name: _: {
    name = "hypr/${name}";
    value.source = ./. + "/Lua/${name}";
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "lua";

    systemd = {
      enable = true;
      variables = [ "--all" ];
    };

    extraConfig = builtins.readFile ./Lua/init.lua;
  };

  xdg.configFile = yutsuLib.scanFiles ".lua" [ "init.lua" ] toXdgConfig ./Lua;
}
