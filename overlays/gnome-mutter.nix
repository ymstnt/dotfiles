{ pkgs, ... }:

(final: prev: {
    mutter = prev.mutter.overrideAttrs (old: {
      pathes = old.patches ++ [(pkgs.fetchpatch2 {
        url = "https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441.diff";
        # GNOME 46: triple-buffering-v4-46
        hash = "sha256-en/4hui0zW8m8ZM2buZhr1FVMW3b9H1ZWKAB2018wmI=";
      })];
    });
})
