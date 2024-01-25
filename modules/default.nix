{ lib, ... }:

{
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "ymstnt" ])
    ./desktops
    ./system.nix
    ./sound.nix
    ./fonts.nix
    ./printing.nix
    ./applications.nix
    ./cli.nix
    ./development.nix
    ./browser.nix
    ./thunderbird.nix
    ./flameshot.nix
    ./gammastep.nix
    ./git.nix
    ./zsh.nix
    ./starship.nix
    ./zoxide.nix
    ./frack.nix
    ./micro.nix
    ./fcast.nix
    ./matlab.nix
  ];
}
