{ self, ... }:

{
  imports =
    [ ./hardware-configuration.nix ] ++
      self.nixosModules.allImportsExcept [
        "games"
        "vmware" # Remove when https://github.com/NixOS/nixpkgs/issues/310121 is fixed
      ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        timeoutStyle = "hidden";
        configurationLimit = 10;
        splashImage = null;
      };
    };

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
