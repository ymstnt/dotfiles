{ pkgs, ... }:

{
  programs.gnupg.agent.enable = true;

  hm.home.packages = (with pkgs; [
    cryptomator
    gimp3
    gparted
    inkscape-with-extensions
    nur.repos.ymstnt.lifeograph
    mpv
    master.hifile
    obs-studio
    onlyoffice-desktopeditors
    openshot-qt
    nur.repos.gepbird.orb-forge-gui
    plexamp
    plex-desktop
    qalculate-gtk
    rquickshare
    stable.rustdesk-flutter
    teamspeak6-client
    telegram-desktop
    tenacity
    vlc
    waveterm
    xclicker
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
    grayjay
    itch
    legcord
    nur.repos.ymstnt.lunatask
    obsidian
    remnote
    signal-desktop-bin
    spotify
    teams-for-linux
  ]) ++ (with pkgs; [
    # GTK apps
    celluloid
    collision
    czkawka
    eyedropper
    fragments
    packet
    pika-backup
    rnote
    stable.mission-center
  ]) ++ (with pkgs.kdePackages; [
    kdenlive
  ]);

  nixpkgs.config.permittedInsecurePackages = [
    "temurin-bin-19.0.2"
  ];
}
