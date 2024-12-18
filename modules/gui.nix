{ pkgs, ... }:

{
  programs.gnupg.agent.enable = true;

  hm.home.packages = (with pkgs; [
    anki-bin
    stable.cryptomator
    gimp
    gparted
    inkscape-with-extensions
    lifeograph
    mpv
    master.hifile
    obs-studio
    onlyoffice-bin
    openshot-qt
    plex-media-player
    protonvpn-gui
    qalculate-gtk
    rquickshare
    stable.rustdesk-flutter
    telegram-desktop
    tenacity
    vlc
    winetricks
    wineWowPackages.staging
    xournalpp
  ]) ++ (with pkgs; [
    # Electron apps
    anytype
    beeper
    discord
    drawio
    element-desktop
    obsidian
    teams-for-linux
    vesktop
  ]) ++ (with pkgs; [
    # GTK apps
    celluloid
    collision
    czkawka
    eyedropper
    fragments
    stable.mission-center
    pika-backup
    rnote
  ]);

  nixpkgs.config.permittedInsecurePackages = [
    "temurin-bin-19.0.2"
  ];
}
