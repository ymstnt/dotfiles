{ spicetify-nix, pkgs, ... }:

let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  imports = [ spicetify-nix.nixosModules.default ];
  
  programs.spicetify = {
    enable = true;
    enabledExtensions = (with spicePkgs.extensions; [
      # Official extensions
      keyboardShortcut
      loopyLoop
      shuffle
      trashbin
    ]) ++ (with spicePkgs.extensions; [
      # Community extensions
      adblock
      addToQueueTop
      copyLyrics
      hidePodcasts
      history
      playingSource
      savePlaylists
      simpleBeautifulLyrics
    ]);
    theme = spicePkgs.themes.lucid;
  };
}
