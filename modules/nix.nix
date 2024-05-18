{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
      "repl-flake"
    ];
    max-jobs = 1;
    trusted-users = [ "ymstnt" ];
    substituters = [ "https://cosmic.cachix.org/" ];
    trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
  };

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
