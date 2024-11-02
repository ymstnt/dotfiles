{ pkgs, ... }:

{
  services.fwupd = {
    enable = true;
  };
  hm.home.packages = with pkgs; [
    gnome-firmware
  ];
}
