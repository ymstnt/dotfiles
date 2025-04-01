{ nixpkgs-stable, nixpkgs-master, nixpkgs-develop, nur, hifile-fix, grayjay, ... }:
# When applied, the master nixpkgs set (declared in the flake inputs) will
# be accessible through 'pkgs.master'
(final: _prev: {
  stable = import nixpkgs-stable {
    system = final.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
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
  hifile-fix = import hifile-fix {
    system = final.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
  grayjay = import grayjay {
    system = final.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
})
