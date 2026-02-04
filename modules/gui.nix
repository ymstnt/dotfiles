{ pkgs, ... }:

{
  programs.gnupg.agent.enable = true;

  hm.home.packages = (with pkgs; [
    cryptomator
    deskflow
    gimp3
    gparted
    inkscape-with-extensions
    nur.repos.ymstnt.lifeograph
    mpv
    master.hifile
    obs-studio
    onlyoffice-desktopeditors
    plexamp
    qalculate-gtk
    rquickshare
    stable.rustdesk-flutter
    teamspeak6-client
    telegram-desktop
    tenacity
    vlc
    xclicker
    xournalpp
  ]) ++ (with pkgs; [
    # Electron apps
    anytype
    nur.repos.ymstnt.beeper
    nur.repos.ymstnt.deepdwn
    discord
    drawio
    filen-desktop
    grayjay
    itch
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
