{ outputs, pkgs, home-manager, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  services.ratbagd.enable = true;
  programs.steam.enable = true;

  home-manager.users.ymstnt = {
    home.packages = with pkgs; [
      unstable.prismlauncher
      piper
      unstable.osu-lazer-bin
    ];
  };
}
