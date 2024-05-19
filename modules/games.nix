{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  programs.steam.enable = true;

  hm.home.packages = with pkgs; [
    prismlauncher
    master.modrinth-app
    piper
 ];
}
