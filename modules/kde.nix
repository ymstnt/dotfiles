{ lib, pkgs, ... }:

{
  specialisation.kde.configuration = {
    services.xserver = {
      displayManager = {
        gdm.enable = lib.mkForce false;
      };
      desktopManager = {
        gnome.enable = lib.mkForce false;
      };
    };
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
    ];
  };
}
