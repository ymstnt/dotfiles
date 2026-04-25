{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    orca-slicer
  ];
}
