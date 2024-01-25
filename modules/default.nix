{ lib, ... }:

{
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "ymstnt" ])
    ./desktops
    ./system.nix
    ./applications.nix
    ./cli.nix
    ./development.nix
    ./browser.nix
    ./thunderbird.nix
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
