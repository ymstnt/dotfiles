{ ... }:

{
  hm.programs.starship = {
    enable = true;
    settings = {
      command_timeout = 5000;
      format = "[](#2A3F6D)\$os\$username[](bg:#395694 fg:#2A3F6D)\$directory[](bg:#466AB6 fg:#395694)\$git_branch\$git_status[](bg:#5374BD fg:#466AB6)\$cmd_duration[ ](fg:#5374BD)"; # grayscale.design Tailwind
      continuation_prompt = "▶▶ ";
      
      username = {
        show_always = true;
        style_user = "bg:#2A3F6D";
        style_root = "bg:#2A3F6D";
        format = "[$user ]($style)";
        disabled = false;
      };

      os = {
        format = "[$symbol]($style)";
        style = "bg:#2A3F6D";
        disabled = false;
      };

      os.symbols = {
        AlmaLinux = " ";
        Alpine = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = " ";
        Gentoo = " ";
        HardenedBSD = " ";
        Illumos = " ";
        Kali = " ";
        Linux = " ";
        Macos = " ";
        Manjaro = " ";
        MidnightBSD = " ";
        Mint = "󰣭 ";
        NetBSD = " ";
        NixOS = " ";
        OpenBSD = " ";
        OpenCloudOS = " ";
        openSUSE = " ";
        OracleLinux = " ";
        Pop = " ";
        Raspbian = " ";
        Redhat = "󱄛 ";
        RedHatEnterprise = "󱄛 ";
        RockyLinux = " ";
        Solus = " ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Void = " ";
        Windows = " ";
      };

      directory = {
        style = "bg:#395694";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = "󰇚 ";
        "Music" = "󰝚 ";
        "Pictures" = " ";
      };

      git_branch = {
        symbol = "";
        style = "bg:#466AB6";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:#466AB6";
        format = "[$all_status$ahead_behind ]($style)";
      };

      cmd_duration = {
        disabled = false;
        format = "[  $duration ]($style)";
        style = "bg:#5374BD";
      };
    };
  };
}
