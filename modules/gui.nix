{ pkgs, ... }:

{
  programs.gnupg.agent.enable = true;

  hm.home.packages = (with pkgs; [
    cryptomator
    gimp3
    gparted
    inkscape-with-extensions
    lifeograph
    mpv
    master.hifile
    obs-studio
    onlyoffice-desktopeditors
    openshot-qt
    plexamp
    plex-media-player
    qalculate-gtk
    rquickshare
    soulseekqt
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
    lunatask
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
    stable.mission-center
    pika-backup
    rnote
  ]);

  nixpkgs.config.permittedInsecurePackages = [
    "temurin-bin-19.0.2"
  ];
}
