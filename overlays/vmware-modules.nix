{ ... }:

# Fix vmware-modules build failure caused by nixpkgs PR #571170 adding
# kmodigest module signing. The manual install doesn't generate .ko.cer
# files, so use the kernel's modules_install target instead.
# Tracked: https://github.com/NixOS/nixpkgs/issues/575192
(final: prev: {
  linuxPackages = prev.linuxPackages.extend (lpFinal: lpPrev: {
    vmware = lpPrev.vmware.overrideAttrs (old: {
      preInstall = "";
      installPhase =
        let
          escapedFlags = builtins.concatStringsSep " " (map prev.lib.escapeShellArg lpPrev.kernel.commonMakeFlags);
        in
        ''
          runHook preInstall
          for module_dir in vmmon-only vmnet-only; do
            make -C ${lpPrev.kernel.dev}/lib/modules/${lpPrev.kernel.modDirVersion}/build \
              M=$PWD/$module_dir \
              INSTALL_MOD_PATH=$out \
              INSTALL_MOD_DIR=misc \
              DEPMOD=true \
              ${escapedFlags} \
              modules_install
          done
          runHook postInstall
        '';
    });
  });
})
