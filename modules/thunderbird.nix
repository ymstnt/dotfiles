{ pkgs, ... }:

{
  hm.programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird;
    profiles.main = {
      isDefault = true;
      userChrome = ''
        #mail-notification-top{
          display: none;
        }
      '';
    };
    settings = {
      "mail.quota.mainwindow_threshold.show" = 0;
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
  };
}
