{ pkgs, vars, ... }:

{

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    substituters = [
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
      "https://zed.cachix.org"
      "https://claude-code.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
      "claude-code.cachix.org-1:YeXf2aNu7UTX8Vwrze0za1WEDS+4DuI2kVeWEE4fsRk="
    ];

  };

  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 10;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
  };

  time = {
    hardwareClockInLocalTime = true;
    timeZone = vars.system.timezone;
  };

  networking = {
    hostName = vars.system.hostname;
    networkmanager.enable = true;
  };

  i18n.defaultLocale = vars.system.locale;
  console.keyMap = vars.system.keyMap;

  services.xserver = {
    enable = true;
    xkb = {
      layout = vars.system.keyMap;
      variant = "";
    };
  };

  programs = {
    firefox.enable = true;
    hyprland.enable = true;
    zsh.enable = true;

    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        zlib
      ];
    };
  };

  users.users.${vars.user.name} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    sops
    ssh-to-age
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

  services.openssh.enable = true;

  ############################################################################################
  # DANGER ZONE
  # /!\
  #
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
