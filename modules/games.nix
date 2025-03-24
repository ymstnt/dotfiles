{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  
  hm.home.packages = with pkgs; [
    mcpelauncher-ui-qt
    nur.repos.gepbird.mint-mod-manager
    osu-lazer-bin
    piper
    prismlauncher
  ];
}
