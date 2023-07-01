{ nixpkgs-master, nixpkgs-develop, nixpkgs-develop-fcast, ... }:
# When applied, the master nixpkgs set (declared in the flake inputs) will
# be accessible through 'pkgs.master'
(final: _prev: {
  master = import nixpkgs-master {
    system = final.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
  develop = import nixpkgs-develop {
    system = final.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
  # TODO: remove once https://github.com/NixOS/nixpkgs/pull/283513 is merged
  develop-fcast = import nixpkgs-develop-fcast {
    system = final.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
})
