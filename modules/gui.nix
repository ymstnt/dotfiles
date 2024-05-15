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
    #anki
    gimp
    master.hifile
    obs-studio
    openshot-qt
    qalculate-gtk
    spacedrive
    super-productivity
    tenacity
    vlc
    winetricks
    wineWowPackages.staging
    xournalpp
    # GTK apps
    celluloid
    #collision
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

  # TODO: Remove once Obsidian updates Electron
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
