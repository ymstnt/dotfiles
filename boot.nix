{ config, pkgs, ... }:

{
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      # Setup keyfile
      secrets = {
        "/crypto_keyfile.bin" = null;
      };

      luks = {
      	devices."luks-29992459-3785-432a-9691-52ced97012df".device = "/dev/disk/by-uuid/29992459-3785-432a-9691-52ced97012df";
      	devices."luks-29992459-3785-432a-9691-52ced97012df".keyFile = "/crypto_keyfile.bin";
      };
    };
  };
	
  networking.hostName = "ymstnt-desktop"; # Define your hostname.
}
