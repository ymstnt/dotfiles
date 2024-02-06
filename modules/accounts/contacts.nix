{ hm, ... }:

{
  hm.accounts.contact.accounts = {
    personal = {
      name = "Névjegyek";
      local = {
        type = "filesystem";
        fileExt = ".vcf";
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
