{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  
  hm.home.packages = with pkgs; [
    prismlauncher
    modrinth-app
    piper
 ];
}
