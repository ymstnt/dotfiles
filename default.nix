{ ... }:

{
  imports =
    [
      ./modules/system.nix
      ./modules/console/cli.nix
      ./modules/desktops/gnome.nix
      ./modules/development.nix
      ./modules/applications.nix
    ];
}
