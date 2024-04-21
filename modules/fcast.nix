{ pkgs, ... }:
{
  programs.fcast-receiver = {
    enable = true;
    openFirewall = true;
    package = pkgs.fcast-receiver;
  };
}
