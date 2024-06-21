{ agenix, ... }:

{
  imports = [ agenix.nixosModules.default ];
  hm.home.packages = [ agenix.packages.x86_64-linux.default ];

  age = {
    secrets = {
    };
  };

}
