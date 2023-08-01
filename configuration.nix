# Edit this configuration file to define what should be installed on
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstable = import 
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)

    { config = config.nixpkgs.config; };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
      ./home.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-29992459-3785-432a-9691-52ced97012df".device = "/dev/disk/by-uuid/29992459-3785-432a-9691-52ced97012df";
  boot.initrd.luks.devices."luks-29992459-3785-432a-9691-52ced97012df".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "ymstnt-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Budapest";
  # Use hardware clock in local time instead of UTC
  # This is required for compatibility with windows
  time.hardwareClockInLocalTime = true;

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;
    
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "hu";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "hu101";

  # Enable fontDir for Flatpak
  fonts.fontDir.enable = true;

  # Fonts
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    #google-fonts
    noto-fonts-emoji
    mplus-outline-fonts.githubRelease
    proggyfonts
    jetbrains-mono
    fira-code
    corefonts
  ];
  
  # Enable CUPS to print documents.
  services.printing.enable = true;
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.sane-airscan ];
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # NTFS
  boot.supportedFilesystems = [ "ntfs" ];

  # Nvidia
  # Make sure opengl is enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Tell Xorg to use the nvidia driver
  services.xserver.videoDrivers = ["nvidia"];

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

  # Enable ZSH
  programs.zsh.enable = true;
  users.users.ymstnt.shell = pkgs.zsh;

  # Enable Tailscale
  services.tailscale.enable = true;

  # Enable ratbagd
  services.ratbagd.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ymstnt = {
    isNormalUser = true;
    description = "YMSTNT";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" "plugdev" ];
    packages = with pkgs; [
      firefox
      brave
      unstable.thunderbird-bin
      (discord.override { withOpenASAR = true; withVencord = true; })
      onlyoffice-bin
      unstable.vscodium
      unstable.obsidian
      unstable.anytype
      syncthing
      evolution
      gnome.gnome-tweaks
      gnome.dconf-editor
      gnome.gnome-software
      cryptomator
      gimp
      pika-backup
      steam
      prismlauncher
      pkgs.gnome-extension-manager
      celluloid
      piper
      telegram-desktop
      obs-studio
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    micro
    pfetch
    starship
    adw-gtk3
    python3
    gnupg
    gcc
    nodejs
    zip
    unzip
    unstable.blackbox-terminal
    exa
    bat
    ripgrep
    zsh-autosuggestions
    zsh-syntax-highlighting
    p7zip
    unstable.tailscale
    android-tools
    python311Packages.pip
  ];

  # GNOME debloat
  environment.gnome.excludePackages = with pkgs.gnome; [
    cheese      # photo booth
    epiphany    # web browser
    totem       # video player
    yelp        # help viewer
    geary       # email client
    gnome-maps
    gnome-music
    pkgs.gnome-photos
    pkgs.gnome-connections
    pkgs.gnome-tour
  ];

  environment.shells = with pkgs; [ 
    zsh 
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  services.pcscd.enable = true;
  programs.gnupg.agent = {
     enable = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  
  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 25565 ];
    allowedUDPPorts = [ 25565 ];
    allowedTCPPortRanges = [
      { from = 27005; to = 27015; }	
    ];
    allowedUDPPortRanges = [
      { from = 27005; to = 27015; }
    ];
  };
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
