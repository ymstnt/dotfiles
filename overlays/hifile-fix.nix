{ ... }:

(final: prev: {
  hifile = prev.hifile.overrideAttrs {
    version = "0.9.9.22";
    src = prev.fetchurl {
      url = "https://www.hifile.app/files/HiFile-${final.hifile.version}.AppImage";
      hash = "";
    };
    appimageContents = prev.appimageTools.extractType2 {
      inherit (final.hifile) pname version src;
    };
    extraInstallCommands = ''
      install -m 444 -D ${final.hifile.appimageContents}/HiFile.desktop $out/share/applications/HiFile.desktop
      install -m 444 -D ${final.hifile.appimageContents}/HiFile.png $out/share/icons/hicolor/512x512/apps/HiFile.png
      substituteInPlace $out/share/applications/HiFile.desktop \
        --replace-fail 'Exec=HiFile' 'Exec=hifile'
    '';
  };
})
