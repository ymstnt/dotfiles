{ pkgs, ... }:

{
  hm.programs.tmux = {
    enable = true;
    escapeTime = 0;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      yank
    ];
    extraConfig = ''
      # make colors inside tmux look the same as outside of tmux
      # see https://github.com/tmux/tmux/issues/696
      # see https://stackoverflow.com/a/41786092
      set-option -ga terminal-overrides ",$TERM:Tc"
    '';
  };
}
