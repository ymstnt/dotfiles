{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  
  hm.home.packages = with pkgs; [
    osu-lazer-bin
    piper
    prismlauncher
  ];
}
