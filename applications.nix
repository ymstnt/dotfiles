{ config, pkgs, home-manager, ... }:

let
  unstable = import <nixos-unstable> { config = config.nixpkgs.config; };
  nix-software-center = import
    (pkgs.fetchFromGitHub {
      owner = "vlinkz";
      repo = "nix-software-center";
      rev = "0.1.2";
      sha256 = "xiqF1mP8wFubdsAQ1BmfjzCgOD3YZf7EGWl9i69FTls=";
    })
    { };
in
{
  imports = [
    /etc/nixos/games.nix
  ];

  programs.gnupg.agent.enable = true;

  home-manager.users.ymstnt = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-devedition;
    };


    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/zip" = [ "org.gnome.FileRoller.desktop" ];
        "text/html" = [ "brave-browser.desktop" ];
        "x-scheme-handler/http" = [ "brave-browser.desktop" ];
        "x-scheme-handler/https" = [ "brave-browser.desktop" ];
        "x-scheme-handler/about" = [ "brave-browser.desktop" ];
        "x-scheme-handler/unknown" = [ "brave-browser.desktop" ];
        "text/calendar" = [ "org.gnome.Calendar.desktop" ];
        "x-scheme-handler/mailto" = [ "thunderbird.desktop" ];
        "image/jpeg" = [ "org.gnome.eog.desktop" ];
        "image/bmp" = [ "org.gnome.eog.desktop" ];
        "image/gif" = [ "org.gnome.eog.desktop" ];
        "image/jpg" = [ "org.gnome.eog.desktop" ];
        "image/pjpeg" = [ "org.gnome.eog.desktop" ];
        "image/png" = [ "org.gnome.eog.desktop" ];
        "image/tiff" = [ "org.gnome.eog.desktop" ];
        "image/webp" = [ "org.gnome.eog.desktop" ];
        "image/x-gray" = [ "org.gnome.eog.desktop" ];
        "image/x-bmp" = [ "org.gnome.eog.desktop" ];
        "image/x-icb" = [ "org.gnome.eog.desktop" ];
        "image/x-ico" = [ "org.gnome.eog.desktop" ];
        "image/x-portable-anymap" = [ "org.gnome.eog.desktop" ];
        "image/x-portable-bitmap" = [ "org.gnome.eog.desktop" ];
        "image/x-portable-graymap" = [ "org.gnome.eog.desktop" ];
        "image/x-portable-pixmap" = [ "org.gnome.eog.desktop" ];
        "image/x-xbitmap" = [ "org.gnome.eog.desktop" ];
        "image/x-xpixmap" = [ "org.gnome.eog.desktop" ];
        "image/x-pcx" = [ "org.gnome.eog.desktop" ];
        "image/svg+xml" = [ "org.gnome.eog.desktop" ];
        "image/svg+xml-compressed" = [ "org.gnome.eog.desktop" ];
        "image/vnd.wap.wbmp" = [ "org.gnome.eog.desktop" ];
        "image/x-icns" = [ "org.gnome.eog.desktop" ];
        "application/pdf" = [ "org.gnome.Evince.desktop" ];
        "x-scheme-handler/anytype" = [ "anytype.desktop" ];
        "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      };
    };

    home.packages = with pkgs; [
      brave
      unstable.thunderbird-bin
      (discord.override { withOpenASAR = true; withVencord = true; })
      onlyoffice-bin
      unstable.obsidian
      unstable.anytype
      vlc
      syncthing
      evolution
      cryptomator
      gimp
      telegram-desktop
      obs-studio
      openshot-qt
      nix-software-center

      gnome.gnome-tweaks
      gnome.dconf-editor
      pkgs.gnome-extension-manager
      celluloid
      czkawka
      unstable.fragments
      unstable.collision
      unstable.eyedropper
      unstable.raider
      unstable.newsflash
      unstable.pika-backup
      unstable.mission-center
    ];
  };
}
