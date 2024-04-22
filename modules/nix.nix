{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "repl-flake"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  hm.home.packages = with pkgs; [
    nh
    nix-output-monitor
    nvd
    nix-inspect
  ];
}
