{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  
  hm.home.packages = with pkgs; [
    mcpelauncher-ui-qt
    nur.repos.gepbird.mint-mod-manager
    piper
    prismlauncher
  ];
}
