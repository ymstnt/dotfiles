{ ... }:

{
 services.xserver = {
    enable = true;
    xkb = {
      layout = "hu";
      variant = "";
    };
    wacom.enable = true;
  };
}
