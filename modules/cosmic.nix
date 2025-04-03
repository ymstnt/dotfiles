{ cosmic-manager, pkgs, ... }:

{
  hm.imports = [
    cosmic-manager.homeManagerModules.cosmic-manager
  ];

  services = {
    desktopManager.cosmic = {
      enable = true;
      xwayland.enable = true;
    };
    displayManager.cosmic-greeter.enable = true;
  };

  programs.seahorse.enable = true;

  hm = {
    wayland.desktopManager.cosmic = {
      enable = true;
      applets = {
        app-list.settings = {
          favorites = [
            "firefox-developer-edition"
            "thunderbird"
            "discord"
            "TeamSpeak"
            "beepertexts"
            "com.system76.CosmicTerm"
            "HiFile"
            "com.system76.CosmicFiles"
            "spotify"
          ];
        };
      };
    };
    gtk = {
      enable = true;
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
    home.packages = (with pkgs; [
        forecast
    ]) ++ (with pkgs; [
        adw-gtk3
        # GNOME apps
        file-roller
        gnome-font-viewer
        loupe
        papers
        simple-scan
    ]);
  };
}
