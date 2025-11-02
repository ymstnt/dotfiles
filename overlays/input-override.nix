{ nixpkgs-stable, nixpkgs-master, nixpkgs-develop,  ... }:
# When applied, the master nixpkgs set (declared in the flake inputs) will
# be accessible through 'pkgs.master'
(final: _prev: {
  stable = import nixpkgs-stable {
    system = final.stdenv.hostPlatform.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
  master = import nixpkgs-master {
    system = final.stdenv.hostPlatform.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
  develop = import nixpkgs-develop {
    system = final.stdenv.hostPlatform.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
})
