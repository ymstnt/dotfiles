{
  description = "ymstnt's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-develop.url = "github:ymstnt/nixpkgs/master";
    nixpkgs-patcher.url = "github:gepbird/nixpkgs-patcher";
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/stable.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cosmic-manager = {
      url = "github:HeitorAugustoLN/cosmic-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
      inputs.darwin.follows = "";
    };
    nix-matlab = {
      url = "gitlab:doronbehar/nix-matlab";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-patch-tenacity-fix-build = {
      url = "https://github.com/NixOS/nixpkgs/pull/461636.diff";
      flake = false;
    };
    nixpkgs-patch-python-proton-core-fix-build = {
      url = "https://github.com/NixOS/nixpkgs/pull/461528.diff";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-patcher, lix-module, home-manager, cosmic-manager, ... } @inputs: {
    nixosConfigurations =
      let
        #inherit (self) outputs;
        mkSystem = host: nixpkgs-patcher.lib.nixosSystem {
          modules = [
            ./overlays
            lix-module.nixosModules.lixFromNixpkgs
            home-manager.nixosModules.default
            host
          ];
          specialArgs = inputs;
        };
      in
      {
        andromeda = mkSystem ./hosts/andromeda;
        cassiopeia = mkSystem ./hosts/cassiopeia;
      };
      nixosModules = import ./modules;
  };
}
