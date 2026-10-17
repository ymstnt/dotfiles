{ ... }:

{
  hm.programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      keyings = {
        shared_except = {
          _args = [ "locked" ];
          _children = [
            {
              bind = {
                _args = [ "Alt g" ];
                _children = [
                  {
                    LaunchPlugin = {
                      _args = [ "filepicker" ];
                    };
                  }
                ];
              };
            }
          ];
        };
      };
    };
  };
}
