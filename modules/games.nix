{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  
  hm.home.packages = with pkgs; [
    modrinth-app
    osu-lazer-bin
    piper
    prismlauncher
  ];
}
