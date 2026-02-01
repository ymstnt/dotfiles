{ nixpkgs-kdenlive, ... }:

(
  final: prev:
  let
    pkgs-kdenlive = import nixpkgs-kdenlive {
      inherit (prev.stdenv.hostPlatform) system;
    };
  in
  {
    kdePackages = prev.kdePackages.overrideScope (
      kdeFinal: kdePrev: {
        kdenlive = prev.symlinkJoin {
          name = "kdenlive-with-plugins-${kdePrev.kdenlive.version}";
          paths = [ pkgs-kdenlive.kdePackages.kdenlive ];
          nativeBuildInputs = [
            prev.makeBinaryWrapper
          ];
          postBuild = ''
            wrapProgram $out/bin/kdenlive --prefix LADSPA_PATH : ${prev.rnnoise-plugin}/lib/ladspa
          '';
        };
      }
    );
  }
)
