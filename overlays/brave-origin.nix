{ nixpkgs-brave-origin, ... }:

(final: prev: {
  inherit (nixpkgs-brave-origin.legacyPackages.x86_64-linux) brave-origin;
})
