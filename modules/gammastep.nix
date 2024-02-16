{ pkgs, ... }:
{
  hm.services.gammastep = {
    enable = false; # Change this to true to enable Redshift
    package = pkgs.redshift;

    latitude = 47.68;
    longitude = 19.09;

    temperature = {
      day = 5700;
      night = 3500;
    };

    settings = {
      general = {
        fade = 1;
        brightness-day = 1;
        brightness-night = 0.85;
        adjustment-method = "randr";
      };
    };
  };
}
