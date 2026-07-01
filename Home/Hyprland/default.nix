{
  lib,
  ...
}:
let
  isLua = lib.strings.hasSuffix ".lua";
  isNotInit = name: name != "init.lua";
  isRegular = _: type: type == "regular";

  filterLua = name: type: isRegular null type && isLua name && isNotInit name;

  toXdgConfig = name: _: {
    name = "hypr/${name}";
    value.source = ./. + "/${name}";
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

    extraConfig = builtins.readFile ./init.lua;
  };

  xdg.configFile = lib.mapAttrs' toXdgConfig (lib.filterAttrs filterLua (builtins.readDir ./.));
}
