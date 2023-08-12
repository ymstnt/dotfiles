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

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
        channelupd = "sudo nix-channel --update";
        nixconfig = "sudo micro /etc/nixos/configuration.nix";
        homeconfig = "sudo micro /etc/nixos/home.nix";
        nixcd = "cd /etc/nixos";
        deletegarbage = "sudo nix-collect-garbage --delete-older-than 30d";
        zshreload = "source ~/.zshrc";
        lf = "ls -la | grep";
        ff = "find | grep";
        hisf = "history | grep";
        rmf = "sudo rm -rf";
        mexec = "sudoc chmod a+x";
        cls = "clear";
        bm = "bashmount";
      };

      shellGlobalAliases = {
        ls = "exa --color=always --group-directories-first --icons"; # Fancier ls with icons
        cat = "bat --style snip --style changes --style header"; # Fancier cat with better previews. Press q to quit
        grep = "rg -i --color=auto"; # Faster grep
        lls = "ls";
      };

      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;

      initExtra = ''
        .  ~/.zshrc_old
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
          "file:///etc/nixos nixos"
          "sftp://ymstnt@ymstnt.com:42727/home/ymstnt/Files Shared Drive"
        ];
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
