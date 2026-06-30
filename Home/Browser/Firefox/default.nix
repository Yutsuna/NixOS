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
