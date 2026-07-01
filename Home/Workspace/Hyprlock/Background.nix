{
  self,
  ...
}:
let
  cyberpunk = "${self}/Assets/Wallpapers/Cyberpunk.png";
in
[
  {
    monitor = "";
    color = "rgb(36, 39, 58)";
    path = "${cyberpunk}";

    blur_size = 3;
    blur_passes = 2;
    noise = 0.0117;
    contrast = 1.000;
    brightness = 1.0000;
    vibrancy = 0.2100;
    vibrancy_darkness = 0.0;
  }
]
