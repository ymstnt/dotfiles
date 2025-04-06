{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    winetricks
    wineWowPackages.staging
  ];
}
