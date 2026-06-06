{ self, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ] ++
      self.nixosModules.allImportsExcept [
        "borgbackup"
        "flatpak"
        "fprintd"
        "games"
        "gnome"
        "hyprland"
        "kitty"
        "packettracer"
        "pantheon"
        "plasma"
        "steam"
        "touchpad"
        "via"
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
            path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
        '';
        maxGenerations = 10;
        style = {
          wallpapers = [
            ./limine_cassiopeia.jpg
          ];
          interface = {
            helpHidden = true;
          };
        };
        secureBoot.enable = true;
      };
      grub.enable = false;
      systemd-boot.enable = false;
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

  environment.systemPackages = [ pkgs.sbctl ];

  networking.hostName = "cassiopeia";

  networking.networkmanager.settings = {
    main = {
      dns = "none";
      systemd-resolved = "false";
    };
  };

  services.timesyncd.enable = true;

  # GPU

  # Tell Xorg to use the modesetting driver
  services.xserver.videoDrivers = [ "modesetting" ];
}
