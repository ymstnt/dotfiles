{ pkgs, ... }:

{
  programs.gnupg.agent.enable = true;

  hm.home.packages = with pkgs; [
    # Electron apps
    discord
    revolt-desktop
    obsidian
    anytype
    lunatask
    drawio
    beeper
    telegram-desktop
    spacedrive
    element-desktop
    onlyoffice-bin
    vlc
    evolution
    cryptomator
    gimp
    obs-studio
    openshot-qt
    tenacity
    wineWowPackages.staging
    winetricks
    master.hifile
    xournalpp
    qalculate-gtk
    # GTK apps
    celluloid
    czkawka
    fragments
    #collision
    eyedropper
    pika-backup
    mission-center
    rnote
  ];

  # TODO: Remove once Obsidian updates Electron
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
