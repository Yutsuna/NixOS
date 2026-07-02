{
  config,
  lib,
  pkgs,
  vars,
  ...
}:

let
  isAmd = vars.hardware.gpu_device == "amd";
  isNvidia = vars.hardware.gpu_device == "nvidia";
in
{

  hardware.graphics.enable = true;

  services.xserver.videoDrivers = lib.optional isAmd "amdgpu" ++ lib.optional isNvidia "nvidia";

  hardware.nvidia = lib.mkIf isNvidia {
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = lib.optionals isAmd (
    with pkgs;
    [
      radeontop
      libva-utils
    ]
  );

}
