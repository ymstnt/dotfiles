{ winapps, pkgs, ... }:

let
  system = "x86_64-linux";
in
{
  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd = {
      enable = true;
      extraConfig = ''
        unix_sock_group = "libvirt"
        unix_sock_rw_perms = "0770"
      '';
      qemu = {
        package = pkgs.qemu_kvm;
      };
    };
  };
  services.qemuGuest.enable = true;
  environment.systemPackages = with pkgs; [ virtiofsd ];
  hm = {
    programs.zsh.sessionVariables = {
      LIBVIRT_DEFAULT_URI = "qemu:///system";
    };
    programs.bash.sessionVariables = {
      LIBVIRT_DEFAULT_URI = "qemu:///system";
    };
    home.packages = ([
      winapps.packages.${system}.winapps
      winapps.packages.${system}.winapps-launcher
    ]) ++ (with pkgs; [
      dialog
      dnsmasq
      freerdp3
      iproute2
      iptables
      libnotify
      libvirt
      mdadm
      netcat
      qemu
    ]);
  };
}
