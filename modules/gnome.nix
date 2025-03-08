{ pkgs, ... }:

{
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;    
  };

  # GNOME extension support
  services.gnome.gnome-browser-connector.enable = true;

  # GNOME debloat
  environment.gnome.excludePackages = (with pkgs; [
    baobab
    epiphany
    evince
    gnome-clocks
    gnome-connections
    gnome-maps
    gnome-music
    gnome-tour
    snapshot
    geary
    totem
    yelp
  ]);

  hm = {
    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;

        enabled-extensions = [
          "app-hider@lynith.dev"
          "caffeine@patapon.info"
          "just-perfection-desktop@just-perfection"
          "quick-touchpad-toggle@kramo.hu"
          "trayIconsReloaded@selfmade.pl"
          "Vitals@CoreCoding.com"
        ];

        favorite-apps = [
          "firefox-developer-edition.desktop"
          "thunderbird.desktop"
          "discord.desktop"
          "TeamSpeak.desktop"
          "element-desktop.desktop"
          "beepertexts.desktop"
          "org.gnome.Console.desktop"
          "HiFile.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "adw-gtk3-dark";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:close";
      };
      "org/gnome/shell/keybindings" = {
        show-screenshot-ui = [
          "Print"
          "<Super><Shift>S"
        ];
      };
    };

    gtk = {
      enable = true;
      gtk3 = {
        bookmarks = [
          "file:///home/ymstnt/Documents"
          "file:///home/ymstnt/Downloads"
          "file:///home/ymstnt/Pictures"
          "file:///home/ymstnt/Videos"
          "file:///home/ymstnt/Music"
          "file:///home/ymstnt/Documents/PROJEKTEK"
          "file:///home/ymstnt/Documents/Egyetem"
          #"file:///home/ymstnt/Documents/Iskola"
          "file:///home/ymstnt/Documents/Munka"
          "file:///home/ymstnt/dotfiles dotfiles"
          "file:///etc/nixos nixos"
          "file:///home/ymstnt/.local/share .local"
          "file:///home/ymstnt/.config .config"
          "sftp://ymstnt@ymstnt.com:42727/home/ymstnt/Files Shared Drive"
          "sftp://ymstnt@ymstnt.com:42727/var/media/ Media Files"
        ];

        extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
      };
      gtk4 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
      };
    };

    qt = {
      enable = false;
      platformTheme.name = "gtk"; # Breaks PacketTracer theme :(
      style.name = "adwaita-dark";
    };

    home.packages = (with pkgs; [
      adwaita-qt
      adw-gtk3
      dconf-editor
      gnome-extension-manager
      gnome-tweaks
      papers
      refine
    ]) ++ (with pkgs.gnomeExtensions; [
      alttab-scroll-workaround
      app-hider
      caffeine
      just-perfection
      quick-touchpad-toggle
      tray-icons-reloaded
      vitals
    ]);
  };
}

