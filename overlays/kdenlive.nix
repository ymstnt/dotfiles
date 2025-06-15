{ ... }:

(final: prev: {
  kdePackages = prev.kdePackages.overrideScope (
    kdeFinal: kdePrev: {
      kdenlive = kdePrev.kdenlive.overrideAttrs (
        prevAttrs: with prev; {
          nativeBuildInputs = (prevAttrs.nativeBuildInputs or [ ]) ++ [ makeBinaryWrapper ];
          postInstall =
            (prevAttrs.postInstall or "")
            + ''
              wrapProgram $out/bin/kdenlive --prefix LADSPA_PATH : ${rnnoise-plugin}/lib/ladspa
            '';
        }
      );
    }
  );
})
