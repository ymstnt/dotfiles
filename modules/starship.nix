{ ... }:

{
  hm.programs.starship = {
    enable = true;
    settings = {
      command_timeout = 1000;
      format = "[](\#2A3F6D)\$os\$username\[](bg:\#395694 fg:\#2A3F6D)\$directory\[](bg:\#466AB6 fg:\#395694)\$git_branch\$git_status\[ ](fg:\#466AB6)";

      username = {
        show_always = true;
        style_user = "bg:\#2A3F6D";
        style_root = "bg:\#2A3F6D";
        format = "[$user ]($style)";
        disabled = false;
      };

      os = {
        format = "[ ]($style)";
        style = "bg:\#2A3F6D";
        disabled = false;
      };

      directory = {
        style = "bg:\#395694";
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
        style = "bg:\#466AB6";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:\#466AB6";
        format = "[$all_status$ahead_behind ]($style)";
      };
    };
  };
}
