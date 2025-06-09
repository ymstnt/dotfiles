{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "repl-flake"
      "flakes"
    ];
    max-jobs = 1;
    trusted-users = [ "ymstnt" ];
    substituters = [
      "https://cosmic.cachix.org/"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "gepbird-nur-packages.cachix.org-1:Ip2iveknanFBbJ2DFWk8cDomfRquUJiMWS/2fSeuMis="
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  programs.nh = {
    enable = true;
    flake = "${config.hm.home.homeDirectory}/dotfiles";
  };

  hm.home.packages = with pkgs; [
    cachix
    hydra-check
    nix-inspect
    nix-output-monitor
    nixpkgs-review
    nvd
  ];
}
