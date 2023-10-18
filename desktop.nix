{ config, pkgs, home-manager, ... }:

let
  unstable = import <nixos-unstable> {
    config = config.nixpkgs.config;
  };
in
{
  services.xserver = {
    enable = true;
    layout = "hu";
    xkbVariant = "";
    displayManager = {
      #defaultSession = "xfce";
      gdm.enable = true;
    };
    desktopManager = {
      gnome.enable = true;
      #xfce.enable = true;
    };
  };

  # Enable sound with pipewire.
  hardware.enableAllFirmware = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable CUPS to print documents and SANE for scanning.
  services = {
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };
  };
  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
    };
  };

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    #google-fonts
    noto-fonts-emoji
    mplus-outline-fonts.githubRelease
    proggyfonts
    corefonts
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];
  # Enable fontDir for Flatpak
  fonts.fontDir.enable = true;

  # GNOME debloat
  environment.gnome.excludePackages = with pkgs.gnome; [
    cheese # photo booth
    epiphany # web browser
    totem # video player
    yelp # help viewer
    geary # email client
    gnome-maps
    gnome-music
    pkgs.gnome-photos
    pkgs.gnome-connections
    pkgs.gnome-tour
  ];

  home-manager.users.ymstnt = {
    services.gammastep = {
      enable = false; # Change this to true to enable Redshift
      package = pkgs.redshift;

      latitude = 47.68;
      longitude = 19.09;

      temperature = {
        day = 5700;
        night = 3500;
      };

      settings = {
        general = {
          fade = 1;
          brightness-day = 1;
          brightness-night = 0.85;
          adjustment-method = "randr";
        };
      };
    };

    services.flameshot = {
      enable = false; # Change this to true to enable Flameshot

      settings = {
        General = {
          contrastOpacity = 188;
          disabledTrayIcon = true;
          drawColor = "#ff0e00";
          drawFontSize = 8;
          drawThickness = 3;
          saveAfterCopy = true;
          savePath = "/home/ymstnt/Pictures/Flameshot";
          savePathFixed = true;
          showHelp = false;
          showStartupLaunchMessage = true;
          startupLaunch = true;
          undoLimit = 99;
        };

        Shortcuts = {
          TYPE_ARROW = "A";
          TYPE_CIRCLE = "C";
          TYPE_CIRCLECOUNT = "";
          TYPE_COMMIT_CURRENT_TOOL = "Ctrl+Return";
          TYPE_COPY = "Ctrl+C";
          TYPE_DELETE_CURRENT_TOOL = "Del";
          TYPE_DRAWER = "D";
          TYPE_EXIT = "Ctrl+Q";
          TYPE_MARKER = "M";
          TYPE_MOVESELECTION = "Ctrl+M";
          TYPE_MOVE_DOWN = "Down";
          TYPE_MOVE_LEFT = "Left";
          TYPE_MOVE_RIGHT = "Right";
          TYPE_MOVE_UP = "Up";
          TYPE_OPEN_APP = "Ctrl+O";
          TYPE_PENCIL = "P";
          TYPE_PIN = "";
          TYPE_PIXELATE = "B";
          TYPE_RECTANGLE = "R";
          TYPE_REDO = "Ctrl+Shift+Z";
          TYPE_RESIZE_DOWN = "Shift+Down";
          TYPE_RESIZE_LEFT = "Shift+Left";
          TYPE_RESIZE_RIGHT = "Shift+Right";
          TYPE_RESIZE_UP = "Shift+Up";
          TYPE_SAVE = "Ctrl+S";
          TYPE_SELECTION = "S";
          TYPE_SELECTIONINDICATOR = "";
          TYPE_SELECT_ALL = "Ctrl+A";
          TYPE_TEXT = "T";
          TYPE_TOGGLE_PANEL = "Space";
          TYPE_UNDO = "Ctrl+Z";
        };
      };
    };

    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;

        enabled-extensions = [
          "just-perfection-desktop@just-perfection"
          "draw-on-your-screen2@zhrexl.github.com"
          "activities-filled-pill@verdre"
          "extensions-sync@elhan.io"
          "caffeine@patapon.info"
          "Vitals@CoreCoding.com"
          "app-hider@lynith.dev"
          "quick-touchpad-toggle@kramo.hu"
          "alt-tab-scroll-workaround@lucasresck.github.io"
        ];

        favorite-apps = [
          "brave-browser.desktop"
          "thunderbird.desktop"
          "discord.desktop"
          "com.raggesilver.BlackBox.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "adw-gtk3-dark";
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
        ];

        extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
      };
      gtk4 = {
        extraConfig = {
          gtk-hint-font-metrics = true;
          gtk-application-prefer-dark-theme = 1;
        };
      };
    };

    home.packages = with pkgs; [
      gnomeExtensions.just-perfection
      gnomeExtensions.draw-on-you-screen-2
      gnomeExtensions.extensions-sync
      gnomeExtensions.caffeine
      gnomeExtensions.vitals
      unstable.gnomeExtensions.app-hider
      gnomeExtensions.quick-touchpad-toggle
      gnomeExtensions.alttab-scroll-workaround
    ];
  };
}
