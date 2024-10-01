{ config, lib, home-manager, ...}:

{
  imports = [
    home-manager.nixosModules.default
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "ymstnt" ])
  ];

  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "backup-<timestamp>";
  };
  
  home-manager.users.ymstnt = {
    home.stateVersion = config.system.stateVersion;
  };
}
