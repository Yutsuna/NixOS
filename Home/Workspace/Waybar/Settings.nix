{
  vars,
  ...
}:

{
  layer = "top";
  position = "top";

  modules-center = [
    "hyprland/window"
    "clock"
  ];

  modules-left = [
    "hyprland/workspaces"
  ];

  modules-right = [
    "custom/exit"
    "pulseaudio"
    "custom/weather"
    "tray"
    "custom/notification"
  ];

  "hyprland/workspaces" = {
    format = "{name}";
    format-icons = {
      default = " ";
      active = " ";
      urgent = " ";
    };
    on-scroll-up = "hyprctl dispatch workspace e+1";
    on-scroll-down = "hyprctl dispatch workspace e-1";
  };
  "clock" = {
    format = " {:%H:%M • %A, %B %d}";
    tooltip = true;
    tooltip-format = "<big>{:%A, %B %d}</big>";
  };
  "hyprland/window" = {
    max-length = 25;
    separate-outputs = false;
    rewrite = {
      "" = "Empty Desktop";
    };
  };
  "memory" = {
    interval = 5;
    format = " {text}%";
    tooltip = true;
  };
  "cpu" = {
    interval = 5;
    format = " {usage:2}%";
    tooltip = true;
  };
  "disk" = {
    format = " {free}";
    tooltip = true;
  };
  "network" = {
    format-icons = [
      "󰤯"
      "󰤟"
      "󰤢"
      "󰤥"
      "󰤨"
    ];
    format-ethernet = " {bandwidthDownOctets}";
    format-wifi = "{icon} {signalStrength}%";
    format-disconnected = "󰤮";
    tooltip = false;
  };
  "tray" = {
    spacing = 12;
  };
  "pulseaudio" = {
    format = "{icon} {volume}% {format_source}";
    format-bluetooth = "{volume}%  {format_source}";
    format-bluetooth-muted = "   {format_source}";
    format-muted = "  {format_source}";
    format-source = "";
    format-source-muted = "";
    format-icons = {
      headphone = "";
      hands-free = "";
      headset = "";
      phone = "";
      portable = "";
      car = "";
      default = [
        ""
        ""
        ""
      ];
    };
    on-click = "pavucontrol";
    on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
  };
  "custom/exit" = {
    tooltip = false;
    format = "";
    on-click = "logout-exit";
  };
  "idle_inhibitor" = {
    format = "{icon}";
    format-icons = {
      activated = "";
      deactivated = "";
    };
    tooltip = "true";
  };
  "custom/notification" = {
    tooltip = false;
    format = "{icon} {text}";
    format-icons = {
      notification = "<span foreground='red'><sup></sup></span>";
      none = "";
      dnd-notification = "<span foreground='red'><sup></sup></span>";
      dnd-none = "";
      inhibited-notification = "<span foreground='red'><sup></sup></span>";
      inhibited-none = "";
      dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
      dnd-inhibited-none = "";
    };
    return-type = "json";
    exec-if = "which swaync-client";
    exec = "swaync-client -swb";
    on-click = "swaync-client -t";
    escape = true;
  };
  "battery" = {
    states = {
      warning = 30;
      critical = 15;
    };
    format = "{icon} {capacity}%";
    format-charging = "󰂄 {capacity}%";
    format-plugged = "󱘖 {capacity}%";
    format-icons = [
      "󰁺"
      "󰁻"
      "󰁼"
      "󰁽"
      "󰁾"
      "󰁿"
      "󰂀"
      "󰂁"
      "󰂂"
      "󰁹"
    ];
    on-click = "";
    tooltip = false;
  };
  "custom/weather" = {
    interval = 3600;
    exec = "wttrbar --location ${vars.location}";
    format = "{text}℃";
    format-alt = "{on-click-right}℉";
    format-alt-click = "click-right";
    on-click = "exec";
    on-click-middle = "xdg-open https://wttr.in/";
    on-click-right = "exec wttrbar";
    return-type = "json";
    tooltip = true;
  };
}
