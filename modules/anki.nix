{ pkgs, ... }:

{
  hm.home.packages = (with pkgs; [
    anki
  ]) ++ (with pkgs.ankiAddons; [
    review-heatmap
  ]);
}
