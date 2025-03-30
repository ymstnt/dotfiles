{ ... }:

(final: prev:
let
  finalAttrs = final.vmware-workstation;
  baseUrl = "https://softwareupdate.vmware.com/cds/vmw-desktop/ws/${finalAttrs.version}/${finalAttrs.build}/linux";
  vmware-unpack-env = prev.buildFHSEnv {
    pname = "vmware-unpack-env";
    inherit (finalAttrs) version;
    targetPkgs = pkgs: [ pkgs.zlib ];
  };
in
{
  vmware-workstation = prev.vmware-workstation.overrideAttrs rec {
    src = prev.requireFile rec {
      name = "VMware-Workstation-${finalAttrs.version}-${finalAttrs.build}.x86_64.bundle.tar";
      url = "${baseUrl}/core/${name}";
      hash = "sha256-FzcS/koLJTXiUWH5H1Au0Eiz8VAH8mboidkQeDLRPmQ=";
    };
    unpackPhase = ''
      tar -xf ${src}
      ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh VMware-Workstation-17.6.1-24319023.x86_64.bundle --extract unpacked"
    '';
  };
})
