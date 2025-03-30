{ ... }:

(final: prev:
let
  spotx = prev.fetchurl {
    url = "https://raw.githubusercontent.com/SpotX-Official/SpotX-Bash/284fc5a17179b6a86cd354d0095b52609323ef42/spotx.sh";
    hash = "sha256-amOYz5Hf/p4a5Gq2669pJelCX2PrynN7Y/dEX0Ib/PE=";
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
