{ pkgs, ... }:

(final: prev: {
  gnome-online-accounts = prev.gnome-online-accounts.overrideAttrs(old: {
    src = prev.fetchFromGitLab {
      domain = "gitlab.gnome.org";
      owner = "GNOME";
      repo = "gnome-online-accounts";
      rev = "829502f63688c0d58ecaade8d7c33744291aaaa0";
      hash = "sha256-mKfMZ0/EGmTioM2MXpYutG00gwSquLtjcdBY/NAIAnA=";
    };
    nativeBuildInputs = old.nativeBuildInputs ++ [
      prev.gi-docgen
    ];
    outputs = [ "out" ];
  });
})
