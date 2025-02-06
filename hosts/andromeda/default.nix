{ self, lib, nixpkgs-nvidia, ... }:

let
  pkgs-nvidia = import nixpkgs-nvidia { }; # nvidia pin
in
{
  imports =
    [ ./hardware-configuration.nix ] ++
      self.nixosModules.allImportsExcept [
        "cosmic"
        "pantheon"
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

  environment.sessionVariables = {
    XCURSOR_SIZE = 28;
  };

  # GPU

  # Tell Xorg to use the nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is needed for most wayland compositors
    modesetting.enable = true;
    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    open = false;
    # Enable the nvidia settings menu
    nvidiaSettings = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = pkgs-nvidia.linuxPackages.nvidiaPackages.beta; # pin nvidia
    # Fix screen tearing
    forceFullCompositionPipeline = true;
    # Fix weird suspend
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

   boot.kernelPackages = lib.mkForce pkgs-nvidia.linuxPackages_6_6; # needs to be pinned because of nvidia
}
