{ pkgs, ... }:

(final: prev: {
  nixos-option = pkgs.hello;
})
