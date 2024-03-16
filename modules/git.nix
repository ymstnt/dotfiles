{ ... }:

{
  hm.programs = {
    git = {
      enable = true;
      userName = "YMSTNT";
      userEmail = "21342713+YMSTNT@users.noreply.github.com";
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
          editor = "hx";
        };
        github = {
          user = "YMSTNT";
        };
      };
    };
    gitui = {
      enable = true;
    };
  };
}
