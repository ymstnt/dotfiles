{ ... }:

(final: prev: {
  # TODO: remove when OpenAsar stops hardcoding the OpenH264 version.
  # OpenAsar passes libopenh264-2.5.1-linux64.7.so as --openh264-library-path,
  # but Discord now downloads 2.7.0 into the asset cache and deletes other versions,
  # so H.264 (most videos and GIFs) fails to decode and stays on the first frame.
  # Use the newest libopenh264 present in the cache instead.
  # Same bug in snap/flatpak: https://github.com/snapcrafters/discord/issues/389
  openasar = prev.openasar.overrideAttrs (old: {
    postPatch = (old.postPatch or "") + ''
      substituteInPlace src/cmdSwitches.js \
        --replace-fail \
          "join(paths.getAssetCachePath(), 'openh264', 'libopenh264-2.5.1-linux64.7.so')" \
          "(() => { const d = join(paths.getAssetCachePath(), 'openh264'); let f; try { f = require('fs').readdirSync(d).filter(x => x.startsWith('libopenh264-') && x.endsWith('.so')).sort((a, b) => a.localeCompare(b, undefined, { numeric: true })).pop(); } catch {} return join(d, f || 'libopenh264-2.5.1-linux64.7.so'); })()"
    '';
  });
})
