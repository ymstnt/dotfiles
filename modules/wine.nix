{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    winetricks
    wineWow64Packages.staging
  ];
}
