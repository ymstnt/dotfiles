{ config, lib, ... }:

{
  hm.accounts.calendar.accounts = {
    personal = {
      name = "Személyes";
      primary = true;
      primaryCollection = "Naptár";
      local = {
        type = "filesystem";
        fileExt = ".ics";
      };
      remote = {
        type = "caldav";
        url = lib.strings.removeSuffix "\n" (builtins.readFile config.age.secrets.calcardav-url.path);
        userName = lib.strings.removeSuffix "\n" (builtins.readFile config.age.secrets.calcardav-username.path);
        passwordCommand = [ "cat ${config.age.secrets.calcardav-password.path}" ];
      };
    };
  };
}
