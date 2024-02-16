{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  programs.steam.enable = true;

  hm.home.packages = with pkgs; [
    prismlauncher
    piper
    osu-lazer-bin
  ];
}
