{ lib, ... }:

{
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "ymstnt" ])
    ./desktops
    ./cli
    ./system.nix
    ./sound.nix
    ./fonts.nix
    ./printing.nix
    ./applications.nix
    ./development.nix
    ./browser.nix
    ./thunderbird.nix
    ./flameshot.nix
    ./gammastep.nix
    ./fcast.nix
    ./matlab.nix
  ];
}
