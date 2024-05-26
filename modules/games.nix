{ pkgs, ... }:

{
  services.ratbagd.enable = true;
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  hm.home.packages = with pkgs; [
    prismlauncher
    master.modrinth-app
    piper
 ];
}
