{ self, config, ... }:

{
  imports =
    [ ./hardware-configuration.nix ] ++
      self.nixosModules.allImportsExcept [
        "cosmic"
        "plasma"
      ];

  boot = {
    loader = {
      timeout = 3;
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        extraEntries = ''
          /Windows 11
            protocol: efi
            path: uuid(6db2c526-be97-4ab8-bf2f-a5867ba6cda0):/EFI/Microsoft/Boot/bootmgfw.efi
        '';
        maxGenerations = 10;
        style = {
          wallpapers = [
            ./limine_andromeda.jpg
          ];
          interface = {
            helpHidden = true;
          };
        };
      };
      grub.enable = false;
      systemd-boot.enable = false;
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
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    # Fix screen tearing
    forceFullCompositionPipeline = true;
    # Fix weird suspend
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

}
