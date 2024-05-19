{ lib, pkgs, ... }:

with lib; with pkgs;
{
  programs.zsh.enable = true; #necessary for zsh as default shell
  environment.shells = [ zsh ];
  users.users.ymstnt.shell = zsh;

  hm.programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
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
      ls = "${getExe eza} --color=always --group-directories-first --icons";
      cat = "${getExe bat} --style snip --style changes --style header";
      grep = "${getExe ripgrep} -i --color=auto";
      fu = "thefuck";
      bm = "bashmount";
      helix = "hx";

      la = "ls -la";
      lff = "ls -la | grep";
      ff = "find | grep";
      hisf = "history | grep";
      rmf = "sudo rm -rf";
      mexec = "sudoc chmod a+x";
      cls = "clear";
      zshreload = "source $HOME/.zshrc";
      
      dotcd = "cd $HOME/dotfiles";
      update = "( cd $HOME/dotfiles && nix flake update --commit-lock-file )";
      rebuild = "nh os switch ~/dotfiles -- --impure";
      rebuild-boot = "nh os boot ~/dotfiles -- --impure";
      nrebuild = "sudo nixos-rebuild switch --flake $HOME/dotfiles --impure";
      nrebuild-boot = "sudo nixos-rebuild boot --flake $HOME/dotfiles --impure";
      cleanup = "sudo nix-collect-garbage --delete-older-than";
    };

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = 1;
      ZSH_AUTOSUGGEST_MANUAL_REBIND = true; # faster prompt
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
      
      try() { NIXPKGS_ALLOW_UNFREE=1 nix shell --impure nixpkgs/nixos-unstable#$1 ''${@:2} }

      github-ssh () {
        private_key = "$HOME/.ssh/id_ed25519"
        public_key="$private_key.pub"
        github_link='https://github.com/settings/ssh/new'
        
        ${getExe' openssh "ssh-keygen"} -t ed25519 -f $private_key

        echo "Add the ssh key below to github as an Authentication and a Signing key: $github_link"
        echo '----BEGIN SSH PUBLIC KEY BLOCK----'
        ${getExe bat} --style snip $public_key
        echo '-----END SSH PUBLIC KEY BLOCK-----'
        
        cat $public_key | ${getExe xsel} -b
        ${getExe' xdg-utils "xdg-open"} $github_link
        echo 'Opened github in browser and copied ssh key to clipboard'
      }

      # chown stuff
      function chtnt () {
        sudo chown -R $USER $argv[1]
        sudo chgrp -R $USER $argv[1]
      }
    '';
  };
}
