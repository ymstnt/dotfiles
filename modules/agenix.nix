{ config, hm, inputs, ... }:

{
  imports = [ inputs.agenix.nixosModules.default ];
  hm.home.packages = [ inputs.agenix.packages.x86_64-linux.default ];

  age = {
    secrets = {
      calcardav-url.file = ../secrets/calcardav-url.age;
      calcardav-username.file = ../secrets/calcardav-username.age;
      calcardav-password.file = ../secrets/calcardav-password.age;
    };
  };

  # environment.systemPackages =
  #   builtins.trace (config.age.secrets.calendar-url.path) [ ] ++
  #   builtins.trace (config.age.secrets.calendar-username.path) [ ] ++
  #   builtins.trace (config.age.secrets.calendar-password.path) [ ];
}
