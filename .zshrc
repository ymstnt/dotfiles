# Fix zsh keybinds to work like bash/fish
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=9999999
SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt INC_APPEND_HISTORY

# Built in autocomplete
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# Aliases
alias zshreload='source ~/.zshrc'
alias lf='ls -la | grep'
alias ff='find | grep'
alias hisf='history | grep'
alias rmf='sudo rm -rf'
alias mexec='sudo chmod a+x'
alias cls='clear'

# Default command switch
alias -g ls='exa --color=always --group-directories-first --icons' # Fancier ls with icons
alias -g cat='bat --style snip --style changes --style header' # Fancier cat with better previews. Press q to quit
alias -g grep='rg -i --color=auto' # Faster grep

alias -g lls="ls"

# Bashmount
alias bm='bashmount'

# Autocomplete
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


# Functions

# chown stuff
function chtnt() {
  sudo chown -R $USER $argv[1]
  sudo chgrp -R $USER $argv[1]
}

# Github SSH key maker
function ssh-make-key() {
  read 'email?Enter email: '
  ssh-keygen -t ed25519 -C $email
  bash -c 'eval "$(ssh-agent -s)"'
  ssh-add ~/.ssh/id_ed25519
  echo 'Add it to github via https://github.com/settings/ssh/new'
  echo '------------- PUBLIC KEY -------------'
  bat --style snip ~/.ssh/id_ed25519.pub
  echo '---------- END OF PUBLIC KEY ----------'
}

# Enable plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Starship
eval "$(starship init zsh)"
export GPG_TTY=$(tty)

# Zsh syntax higlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
