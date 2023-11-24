{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "ntfs" ];

    initrd = {
      # Setup keyfile
      secrets = {
        "/crypto_keyfile.bin" = null;
      };

      luks = {
        devices."luks-4a3b28c6-8757-41ee-a2bc-14364ba667ef".device = "/dev/disk/by-uuid/4a3b28c6-8757-41ee-a2bc-14364ba667ef";
        devices."luks-4a3b28c6-8757-41ee-a2bc-14364ba667ef".keyFile = "/crypto_keyfile.bin";
      };
    };
  };

  networking.hostName = "cassiopeia";

  # GPU

  # Tell Xorg to use the modesetting driver
  services.xserver.videoDrivers = [ "modesetting" ];
}
