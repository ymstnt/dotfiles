{ config, pkgs, cosmic-manager, ... }:

let
  cosmicLib = config.hm.lib;
in
{
  hm.imports = [
    cosmic-manager.homeManagerModules.cosmic-manager
  ];

  services = {
    desktopManager.cosmic = {
      enable = true;
      xwayland.enable = true;
    };
    displayManager.cosmic-greeter.enable = true;
  };

  programs.seahorse.enable = true;

  hm = {
    wayland.desktopManager.cosmic = {
      enable = true;
      applets = {
        app-list.settings = {
          favorites = [
            "firefox-devedition"
            "thunderbird"
            "discord"
            "TeamSpeak"
            "beepertexts"
            "signal"
            "com.system76.CosmicTerm"
            "HiFile"
            "com.system76.CosmicFiles"
            "lunatask"
            "spotify"
          ];
        };
      };
    };
    programs.cosmic-files = {
      enable = true;
      settings = {
        favorites = [
          (cosmicLib.cosmic.mkRON "enum" "Home")
          (cosmicLib.cosmic.mkRON "enum" "Documents")
          (cosmicLib.cosmic.mkRON "enum" "Downloads")
          (cosmicLib.cosmic.mkRON "enum" "Music")
          (cosmicLib.cosmic.mkRON "enum" "Pictures")
          (cosmicLib.cosmic.mkRON "enum" "Videos")
          (cosmicLib.cosmic.mkRON "enum" {
            value = [ "/home/ymstnt/Documents/PROJEKTEK" ];
            variant = "Path";
          })
          (cosmicLib.cosmic.mkRON "enum" {
            value = [ "/home/ymstnt/Documents/Egyetem" ];
            variant = "Path";
          })
          # (cosmicLib.cosmic.mkRON "enum" {
          #   value = [ "/home/ymstnt/Documents/Iskola" ];
          #   variant = "Path";
          # })
          (cosmicLib.cosmic.mkRON "enum" {
            value = [ "/home/ymstnt/Documents/Munka" ];
            variant = "Path";
          })
          (cosmicLib.cosmic.mkRON "enum" {
            value = [ "/home/ymstnt/dotfiles" ];
            variant = "Path";
          })
          (cosmicLib.cosmic.mkRON "enum" {
            value = [ "/etc/nixos" ];
            variant = "Path";
          })
          (cosmicLib.cosmic.mkRON "enum" {
            value = [ "/home/ymstnt/local/share" ];
            variant = "Path";
          })
          (cosmicLib.cosmic.mkRON "enum" {
            value = [ "/home/ymstnt/.config" ];
            variant = "Path";
          })
        ];
      };
    };
    gtk = {
      enable = true;
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
    home.packages = (with pkgs; [
        forecast
    ]) ++ (with pkgs; [
        adw-gtk3
        # GNOME apps
        file-roller
        gnome-font-viewer
        loupe
        papers
        simple-scan
    ]);
  };
}
