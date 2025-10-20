{ ... }:

(final: prev:
let
  spotx = prev.fetchurl {
    url = "https://raw.githubusercontent.com/SpotX-Official/SpotX-Bash/12cfe5dcec1d82cb613d8aa8dd60f4cd181dfb06/spotx.sh";
    hash = "sha256-ruptTkIhcnlRkvpGnyfx9tmjVZoUWCv0vzXDvVLemp8=";
  };
in
  {
    spotify =  (prev.spotify.overrideAttrs (old: {
      nativeBuildInputs =
        old.nativeBuildInputs
        ++ (with prev; [
          util-linux
          perl
          unzip
          zip
          curl
        ]);

      unpackPhase = builtins.replaceStrings [ "runHook postUnpack" ] [
        ''
          patchShebangs --build ${spotx}
          runHook postUnpack
        ''
      ] old.unpackPhase;

      installPhase = builtins.replaceStrings [ "runHook postInstall" ] [
        ''
          bash ${spotx} -f -P "$out/share/spotify"
          runHook postInstall
        ''
      ] old.installPhase;
    }));
  }
)
