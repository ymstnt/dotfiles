{ pkgs, ... }:

{
  hm = {
    programs = {
      git = {
        enable = true;
        settings = {
          user = {
            name = "ymstnt";
            email = "21342713+ymstnt@users.noreply.github.com";
          };
          alias = {
            s = "status -uno";
            d = "diff";
            c = "commit -m";
            p = "!git pull && git push";
            br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
            lg = "!git log --pretty=format:\'%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\' --abbrev-commit -30";
          };
          init.defaultBranch = "main";
          core.editor = "hx";
          push.autoSetupRemote = true;
          pull.rebase = true;
          github.user = "ymstnt";
        };
      };
      gitui = {
        enable = true;
      };
    };
    home.packages = with pkgs; [
      gitu
      ungit
      git-extras
    ];
  };
}
