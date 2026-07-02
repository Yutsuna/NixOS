{
  pkgs,
  self,
  ...
}:
let
  icons = "${self}/Assets/Wlogout";
  template = builtins.replaceStrings [ ''url("YutsuScript/'' ] [ ''url("${icons}/'' ] (
    builtins.readFile ./styles.scss
  );
  templateFile = pkgs.writeText "wlogout-style-template.css" template;
in
pkgs.writeShellApplication {
  name = "wlogout-launch";
  runtimeInputs = with pkgs; [
    wlogout
    jq
    gettext
  ];
  text = ''
    if pgrep -x wlogout >/dev/null; then
      pkill -x wlogout
      exit 0
    fi

    mon=$(hyprctl -j monitors | jq '.[] | select(.focused == true)')
    x_mon=$(jq -r '.width' <<<"$mon")
    y_mon=$(jq -r '.height' <<<"$mon")
    scale=$(jq -r '.scale * 100 | floor' <<<"$mon")

    x_log=$((x_mon * 100 / scale))
    y_log=$((y_mon * 100 / scale))

    export x_mgn=$((x_log * 35 / 100))
    export y_mgn=$((y_log * 25 / 100))
    export x_hvr=$((x_log * 32 / 100))
    export y_hvr=$((y_log * 20 / 100))
    export fontSize=$((y_log * 2 / 100))

    hypr_border=$(hyprctl -j getoption decoration:rounding | jq -r '.int // 10')
    [ "$hypr_border" -eq 0 ] && hypr_border=10
    export active_rad=$((hypr_border * 5))
    export button_rad=$((hypr_border * 8))

    wlogout -b 2 -c 0 -r 0 -m 0 \
      --css <(envsubst <${templateFile}) \
      --protocol layer-shell
  '';
}
