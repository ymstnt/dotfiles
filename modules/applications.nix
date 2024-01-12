{ outputs, pkgs, home-manager, ... }:
{
  imports = [
    ./matlab.nix
    ./browser.nix
  ];

  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  programs.gnupg.agent.enable = true;

  home-manager.users.ymstnt = {
    home.packages = with pkgs; [
      # Electron apps
      (unstable.discord.override { withOpenASAR = true; withVencord = true; })
      unstable.revolt-desktop
      unstable.obsidian
      unstable.anytype
      unstable.lunatask
      unstable.p3x-onenote
      unstable.drawio
      unstable.beeper
      unstable.telegram-desktop
      unstable.spacedrive
      onlyoffice-bin
      thunderbird
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

      gnome.gnome-tweaks
      gnome.dconf-editor
      pkgs.gnome-extension-manager
      celluloid
      czkawka
      unstable.newsflash
      unstable.fragments
      collision
      unstable.eyedropper
      unstable.pika-backup
      unstable.mission-center
      unstable.rnote
      unstable.flowtime
    ];
  };
}
