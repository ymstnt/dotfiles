{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
     via
     vial
     qmk
  ];

  hardware.keyboard.qmk.enable = true;
  
  services.udev = {
    packages = with pkgs; [
      qmk
      qmk-udev-rules
      qmk_hid
      via
      vial
    ];
  };
}
