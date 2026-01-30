{ pkgs, ... }:

{
  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];

  hm.xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
      config = {
        common = {
          default = [ "gtk" ];
          "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        };
        hyprland = {
          default = [
            "gtk"
            "hyprland"
          ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
          "org.freedesktop.impl.portal.OpenURI" = [ "gtk" ];
        };
      };
    };
    desktopEntries = {
      discord = {
        name = "Discord";
        genericName = "All-in-one·cross-platform·voice·and·text·chat·for·gamers";
        exec = "env -u WAYLAND_DISPLAY Discord";
        icon = "discord";
        type = "Application";
        categories = [
          "Network"
          "InstantMessaging"
        ];
        mimeType = [ "x-scheme-handler/discord" ];
        settings = {
          StartupWMClass = "discord";
          Version = "1.5";
        };
      };
      lunatask = {
        name = "Lunatask";
        exec = "lunatask";
        icon = "lunatask";
        type = "Application";
        categories = [
          "Office"
        ];
        mimeType = [ "x-scheme-handler/lunatask" ];
        settings = {
          StartupWMClass = "Lunatask";
          Comment = "Encrypted to-do list, habit and mood tracker, journaling and notes app";
        };
      };
    };
  };
}
