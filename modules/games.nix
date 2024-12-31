{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  
  hm.home.packages = with pkgs; [
    mcpelauncher-ui-qt
    osu-lazer-bin
    piper
    prismlauncher
  ];
}
