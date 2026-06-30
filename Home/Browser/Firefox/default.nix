{
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;

    package = pkgs.firefox;

    policies = {
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;

      "3rdparty".Extensions = {
        "uBlock0@raymondhill.net" = {
          adminSettings = {
            userSettings = {
              uiTheme = "light";
              uiAccentCustom = true;
              uiAccentCustom0 = "#CA9EE6";
            };
          };
        };
      };
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      search = {
        force = true;
        default = "google";
      };
    };
  };
}
