{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    nebula
  ];
}
