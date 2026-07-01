{
  vars,
  ...
}:

{
  layer = "top";
  position = "top";

  modules-center = [
    "clock"
  ];

  modules-left = [
    "hyprland/workspaces"
    "cpu"
    "custom/gpu"
    "memory"
    "disk"
  ];

  modules-right = [
    "pulseaudio"
    "custom/weather"
    "battery"
    "tray"
    "custom/exit"
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
  "memory" = {
    interval = 5;
    format = " {percentage}%";
    tooltip = true;
  };
  "cpu" = {
    interval = 5;
    format = " {usage:2}%";
    tooltip = true;
  };

  "custom/gpu" = {
    interval = 5;
    exec =
      if vars.hardware.gpu_device == "nvidia" then
        "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits"
      else if vars.hardware.gpu_device == "amd" then
        "cat /sys/class/hwmon/hwmon*/device/gpu_busy_percent 2>/dev/null || echo 0"
      else
        "echo 0";
    format = " {}%";
    tooltip = false;
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
    on-click = "exec";
    on-click-middle = "xdg-open https://wttr.in/";
    on-click-right = "exec wttrbar";
    return-type = "json";
    tooltip = true;
  };
}
