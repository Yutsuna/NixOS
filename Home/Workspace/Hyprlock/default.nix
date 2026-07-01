{
  self,
  ...
}:

let

  background = import ./Background.nix { inherit self; };
  input-field = import ./InputField.nix;
  label = import ./Label.nix;

in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };
      inherit background input-field label;
    };
  };
}
