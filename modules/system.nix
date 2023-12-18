{ pkgs, libs, inputs, outputs, config, home-manager, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  boot = {
    supportedFilesystems = [ "ntfs" ];
  };

  networking = {
    networkmanager.enable = true;

    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 8384 ];
      allowedUDPPorts = [ 25565 8384 ];
      allowedTCPPortRanges = [
        { from = 27005; to = 27015; }
      ];
      allowedUDPPortRanges = [
        { from = 27005; to = 27015; }
      ];
    };
  };
  systemd.services.NetworkManager-wait-online.enable = false;

  # Enable Tailscale
  services.tailscale = {
    enable = true;
    package = pkgs.unstable.tailscale;
  };

  time.timeZone = "Europe/Budapest";
  # Use hardware clock in local time instead of UTC
  # This is required for compatibility with windows
  time.hardwareClockInLocalTime = true;

  # Configure console keymap
  console.keyMap = "hu101";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "hu_HU.UTF-8";
  };

  users.users.ymstnt = {
    isNormalUser = true;
    description = "YMSTNT";
    extraGroups = [
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
      "plugdev"
      "adbusers"
    ];
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  services.pcscd.enable = true;

  # GPU
  # Make sure opengl is enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  home-manager.users.ymstnt = {
    home.stateVersion = config.system.stateVersion;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}