{ inputs, outputs, config, pkgs, home-manager, ... }:

{
  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  services.ratbagd.enable = true;
  programs.steam.enable = true;

  home-manager.users.ymstnt = {
    home.packages = with pkgs; [
      prismlauncher
      piper
      unstable.collision
    ];
  };
}
