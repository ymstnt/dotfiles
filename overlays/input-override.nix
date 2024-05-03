{ nixpkgs-master, nixpkgs-develop, lunatask-update, ... }:
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
  lunatask = import lunatask-update {
    system = final.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
})
