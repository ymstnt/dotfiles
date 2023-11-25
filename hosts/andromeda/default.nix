{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/games.nix
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
        devices."luks-29992459-3785-432a-9691-52ced97012df".device = "/dev/disk/by-uuid/29992459-3785-432a-9691-52ced97012df";
        devices."luks-29992459-3785-432a-9691-52ced97012df".keyFile = "/crypto_keyfile.bin";
      };
    };
  };

  networking.hostName = "andromeda";

  # GPU

  # Tell Xorg to use the nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is needed for most wayland compositors
    modesetting.enable = true;
    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    open = true;
    # Enable the nvidia settings menu
    nvidiaSettings = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    # Fix screen tearing
    forceFullCompositionPipeline = true;
    # Fix weird suspend
    powerManagement.enable = true;
  };

}
