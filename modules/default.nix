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
    ./git.nix
    ./zsh.nix
    ./starship.nix
    ./zoxide.nix
    ./micro.nix
    ./matlab.nix
  ];
}
