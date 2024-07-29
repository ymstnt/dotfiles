{ pkgs, ... }:

(final: prev: {
  steam = prev.steam.override {
    extraPkgs = pkgs: with pkgs; [
      pango
      harfbuzz
      libthai
    ];
  };
})
