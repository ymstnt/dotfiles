{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  
  hm.home.packages = with pkgs; [
    hytale-launcher
    mcpelauncher-ui-qt
    nur.repos.gepbird.mint-mod-manager
    piper
    prismlauncher
  ];
}
