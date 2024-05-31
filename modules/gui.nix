{ pkgs, ... }:

{
  programs.gnupg.agent.enable = true;

  hm.home.packages = with pkgs; [
    # Electron apps
    anytype
    beeper
    discord
    drawio
    element-desktop
    lunatask
    obsidian
    onlyoffice-bin
    revolt-desktop
    telegram-desktop
    cryptomator
    lifeograph
    anki
    gimp
    master.hifile
    obs-studio
    openshot-qt
    qalculate-gtk
    spacedrive
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
    mission-center
    pika-backup
    rnote
    planify
    hieroglyphic
    ptyxis
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "openjdk-19-ga"
  ];
}
