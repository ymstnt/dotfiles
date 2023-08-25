{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = config.nixpkgs.config; };
in
{
  home-manager.users.ymstnt = {
    # This should be the same value as `system.stateVersion` in
    # your `configuration.nix` file.
    home.stateVersion = "23.05";

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      autocd = true;

      history = {
        path = "$HOME/.zsh_history";
        size = 9999999;
        extended = true;
        expireDuplicatesFirst = true;
        ignoreDups = true;
        #ignoreAllDups = true;
        ignoreSpace = true;
        share = true;
      };

      completionInit = "autoload -U compinit && compinit -C"; # add caching to save ~50ms load time
      shellAliases = {
        ls = "${pkgs.exa}/bin/exa --color=always --group-directories-first --icons";
        cat = "${pkgs.bat}/bin/bat --style snip --style changes --style header";
        grep = "${pkgs.ripgrep}/bin/rg -i --color=auto";

        ll = "ls -l";
        lf = "ls -la | grep";
        ff = "find | grep";
        hisf = "history | grep";
        rmf = "sudo rm -rf";
        mexec = "sudoc chmod a+x";
        cls = "clear";
        bm = "bashmount";
        zshreload = "source $HOME/.zshrc";
        nixconfig = "micro $HOME/dotfiles/configuration.nix";
        homeconfig = "micro $HOME/dotfiles/home.nix";
        nixcd = "cd /etc/nixos";
        dotcd = "cd $HOME/dotfiles";
        cleanup = "sudo nix-collect-garbage --delete-older-than";

      };

      profileExtra = ''
        export QT_QPA_PLATFORMTHEME=gtk2 # for Qt 5 and 6 apps
      '';

      initExtra = ''
        bindkey "^[[H" beginning-of-line
        bindkey "^[[F" end-of-line
        bindkey "^[[3~" delete-char
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word

        shift-arrow () {
          ((REGION_ACTIVE)) || zle set-mark-command
          zle $1
        }
        for key  kcap seq widget (
            left  LFT $"\e[1;2D" backward-char
            right RIT $"\e[1;2C" forward-char
            up ri  $"\e[1;2A" up-line-or-history
            down ind $"\e[1;2B" down-line-or-history
          ) {
          functions[shift-$key]="shift-arrow $widget"
          zle -N shift-$key
          bindkey ''${terminfo[k$kcap]-$seq} shift-$key
        }

        setopt EXTENDED_HISTORY # Write the history file in the ':start:elapsed;command' format.
        setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
        setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
        setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
        setopt INC_APPEND_HISTORY

        # Built in autocomplete
        zstyle ': completion:*' menu select
        # Auto complete with case insenstivity
        zstyle ': completion:*' matcher-list "" 'm: { a-zA-Z }={A-Za-z}' 'r: |[ ._- ]=* r:|=*' 'l:|=* r:|=*'

        # Autocomplete
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
        ZSH_AUTOSUGGEST_STRATEGY=(history completion)

        # This speeds up pasting w/ autosuggest
        # https://github.com/zsh-users/zsh-autosuggestions/issues/238
        pasteinit () {
          OLD_SELF_INSERT = ''${''${(s.:.) widgets [self-insert ]}[ 2,3 ]}
          zle - N self-insert url-quote-magic
        }

        pastefinish() {
          zle -N self-insert $OLD_SELF_INSERT
        }
        zstyle :bracketed-paste-magic paste-init pasteinit
        zstyle :bracketed-paste-magic paste-finish pastefinish

        update () {
          if [[ "$1" == "-c" || "$1" == "--channel" || "$1" == "-a" || "$1" == "--all" ]];
          then
            sudo nix-channel --update
          fi
          if [[ -z "$1" || "$1" == "-a" || "$1" == "--all" ]]; then
            sudo nixos-rebuild switch -I nixos-config=$HOME/dotfiles/configuration.nix
          fi
        }

        github-ssh () {
          private_key = "$HOME/.ssh/id_ed25519"
          public_key="$private_key.pub"
          github_link='https://github.com/settings/ssh/new'
          echo "Generating ssh key to $key_file"
          ${pkgs.openssh}/bin/ssh-keygen -t ed25519 -f $private_key
          echo "Add the ssh key below to github as an Authentication and a Signing key: $github_link"
          echo '----BEGIN SSH PUBLIC KEY BLOCK----'
          ${pkgs.bat}/bin/bat --style snip $public_key
          echo '-----END SSH PUBLIC KEY BLOCK-----'
          ${pkgs.xdg-utils}/bin/xdg-open $github_link
          cat $public_key | ${pkgs.xsel}/bin/xsel -b
          echo 'Opened github in browser and copied ssh key to clipboard'
        }

        # chown stuff
        function chtnt () {
          sudo chown -R $USER $argv[1]
          sudo chgrp -R $USER $argv[1]
        }
      '';
    };

    programs.starship = {
      enable = true;
      settings = {
        format = "[](\#003F5E)\$os\$username\[](bg:\#005077 fg:\#003F5E)\$directory\[](bg:\#006496 fg:\#005077)\$git_branch\$git_status\[ ](fg:\#006496)";

        username = {
          show_always = true;
          style_user = "bg:\#003F5E";
          style_root = "bg:\#003F5E";
          format = "[$user ]($style)";
          disabled = false;
        };

        os = {
          format = "[ ]($style)";
          style = "bg:\#003F5E";
          disabled = false;
        };

        directory = {
          style = "bg:\#005077";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };

        directory.substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };

        git_branch = {
          symbol = "";
          style = "bg:\#006496";
          format = "[ $symbol $branch ]($style)";
        };

        git_status = {
          style = "bg:\#006496";
          format = "[$all_status$ahead_behind ]($style)";
        };
      };
    };

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

    programs.git = {
      enable = true;
      userName = "YMSTNT";
      userEmail = "ymstnt@mailbox.org";
      aliases = {
        s = "status -uno";
        d = "diff";
        c = "commit -m";
        p = "!git pull && git push";
        br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
        lg = "!git log --pretty=format:\'%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\' --abbrev-commit -30";
      };
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        core = {
          editor = "micro";
        };
        github = {
          user = "YMSTNT";
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
          "file:///home/ymstnt/Documents/Iskola"
          "file:///home/ymstnt/Documents/Munka"
          "file:///home/ymstnt/dotfiles dotfiles"
          "file:///etc/nixos nixos"
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
    ];
  };
}










