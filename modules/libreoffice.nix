{ pkgs, ... }:

{
  hm.home.packages = (with pkgs; [
    libreoffice-qt6-fresh
  ]) ++ (with pkgs.hunspellDicts; [
    hu_HU
    hu-hu
    en_US
    en-us
  ]);
}
