{ config, lib, pkgs, home-manager, ...}:

{
  imports = [
    home-manager.nixosModules.default
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "ymstnt" ])
  ];

  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = ".bak";
    backupCommand = lib.getExe pkgs.trash-cli;
  };
  
  home-manager.users.ymstnt = {
    home.stateVersion = config.system.stateVersion;
  };
}
