{ ... }:

(final: prev: {
  pop-launcher = prev.pop-launcher.overrideAttrs rec {
    version = "1.2.4-unstable-2025-03-24";
    src = prev.fetchFromGitHub {
      owner = "pop-os";
      repo = "launcher";
      rev = "58a8f2db649098463b183c09cfa5897db217e2cf";
      hash = "sha256-v8py/IgbUuV52v9WsAYTszupwho32O8NohipviOiQoY=";
    };
    cargoDeps = prev.rustPlatform.fetchCargoVendor {
      inherit src;
      hash = "sha256-MLh6gI8Kfio655Df+o58/8aAJNxoT51feHvkjtPgPrU=";
    };
  };
})
