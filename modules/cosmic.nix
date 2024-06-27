{ lib, pkgs, nixos-cosmic, ... }:

{
  imports = [ nixos-cosmic.nixosModules.default ];

  specialisation.cosmic.configuration = {
    services.xserver = {
      displayManager.gdm.enable = lib.mkForce false;
      desktopManager.gnome.enable = lib.mkForce false;
    };
    services = {
      desktopManager.cosmic.enable = true;
      displayManager.cosmic-greeter.enable = true;
    };
    fonts.packages = with pkgs; [
      cantarell-fonts
    ];
    hm = {
      dconf.settings = {
        "org/gnome/desktop/wm/preferences" = {
          button-layout = lib.mkForce "appmenu:minimize,maximize,close";
        };
      };
      home.packages = (with pkgs; [
        gnome-console
      ]);
    };
  };
}
