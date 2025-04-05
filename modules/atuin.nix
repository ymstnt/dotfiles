{ ... }:

{
  hm.programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
    settings = {
      update_check = false;
      search_mode = "skim";
      inline_height = 10;
      show_help = false;
      exit_mode = "return-query";
    };
  };
}
