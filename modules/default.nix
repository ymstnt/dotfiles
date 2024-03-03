{ lib, ... }:

{
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "ymstnt" ])
    ./desktops
    ./cli
    ./agenix.nix
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
    ./vmware.nix
    ./matlab.nix
    ./wireshark.nix
  ];
}
