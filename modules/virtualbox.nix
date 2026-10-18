{ pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "ymstnt" ];

  # Needed for VirtualBox not to crash when opening a file dialog
  # Remove this when https://github.com/NixOS/nixpkgs/pull/575432 reaches unstable
  services.desktopManager.gnome.extraGSettingsOverridePackages = [ pkgs.gtk3 ];
}
