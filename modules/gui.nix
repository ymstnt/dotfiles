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
    qalculate-gtk
    teamspeak6-client
    telegram-desktop
    tenacity
    vlc
    xclicker
    xournalpp
  ]) ++ (with pkgs; [
    # Electron apps
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
    signal-desktop
    spotify
    teams-for-linux
  ]) ++ (with pkgs; [
    # GTK apps
    celluloid
    collision
    czkawka
    eyedropper
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
