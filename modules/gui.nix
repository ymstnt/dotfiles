{ pkgs, ... }:

{
  programs.gnupg.agent.enable = true;

  hm.home.packages = with pkgs; [
    # Electron apps
    anki-bin
    anytype
    beeper
    cryptomator
    discord
    drawio
    element-desktop
    gimp
    lifeograph
    lunatask
    master.hifile
    obsidian
    obs-studio
    onlyoffice-bin
    openshot-qt
    qalculate-gtk
    rquickshare
    telegram-desktop
    tenacity
    vlc
    winetricks
    wineWowPackages.staging
    xournalpp
    # GTK apps
    celluloid
    collision
    czkawka
    eyedropper
    fragments
    hieroglyphic
    mission-center
    pika-backup
    planify
    ptyxis
    rnote
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "openjdk-19-ga"
  ];
}
