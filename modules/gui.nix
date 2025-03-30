{ pkgs, ... }:

{
  programs.gnupg.agent.enable = true;

  hm.home.packages = (with pkgs; [
    cryptomator
    gimp
    gparted
    inkscape-with-extensions
    lifeograph
    mpv
    hifile-fix.hifile
    obs-studio
    onlyoffice-bin
    openshot-qt
    plex-media-player
    plexamp
    protonvpn-gui
    qalculate-gtk
    rquickshare
    stable.rustdesk-flutter
    telegram-desktop
    teamspeak6-client
    tenacity
    vlc
    waveterm
    winetricks
    wineWowPackages.staging
    xournalpp
  ]) ++ (with pkgs; [
    # Electron apps
    anytype
    nur.repos.ymstnt.beeper
    nur.repos.ymstnt.deepdwn
    discord
    drawio
    element-desktop
    filen-desktop
    itch
    legcord
    obsidian
    remnote
    signal-desktop
    spotify
    teams-for-linux
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
