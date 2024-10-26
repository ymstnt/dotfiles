{ self, config, ... }:

{
  imports =
    [ ./hardware-configuration.nix ] ++
      self.nixosModules.allImportsExcept [
        "cosmic"
      ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        timeoutStyle = "hidden";
        splashImage = null;
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
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

}
