{ config, pkgs, home-manager, nixpkgs-unstable, nixpkgs-develop, ... }:

{
  services.ratbagd.enable = true;
  programs.steam.enable = true;

  home-manager.users.ymstnt = {
    home.packages = with pkgs; [
      prismlauncher
      piper
      nixpkgs-unstable.collision
    ];
  };
}
