{ config, pkgs, home-manager, lib, ... }:

let
  unstable = import <nixos-unstable> {
    config = config.nixpkgs.config;
  };
in
{
  imports = [
    ./zsh.nix
    ./git.nix
  ];

  home-manager.users.ymstnt = {
    home.packages = with pkgs; [
      unstable.blackbox-terminal
      wget
      micro
      pfetch
      starship
      adw-gtk3
      gnupg
      zip
      unzip
      unrar
      p7zip
      exa
      bat
      ripgrep
      hck
      sof-firmware
      sshfs
      smartmontools
      yt-dlp
      unstable.spotdl
      rnix-lsp
      nixpkgs-fmt
      nix-prefetch
    ];

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

    programs.zoxide = {
      enable = true;
      options = [ "--cmd j" ];
    };
  };
}
