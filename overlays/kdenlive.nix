{ ... }:

(final: prev: {
  kdePackages = prev.kdePackages.overrideScope (
    kdeFinal: kdePrev: {
      kdenlive = prev.symlinkJoin {
        name = "kdenlive-with-plugins-${kdePrev.kdenlive.version}";
        paths = [ kdePrev.kdenlive ];
        nativeBuildInputs = [
          prev.makeBinaryWrapper
        ];
        postBuild = ''
          wrapProgram $out/bin/kdenlive --prefix LADSPA_PATH : ${prev.rnnoise-plugin}/lib/ladspa
        '';
      };
    }
  );
})
