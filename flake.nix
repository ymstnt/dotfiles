{
  description = "ymstnt's NixOS configuration";

  inputs = {
    # Revert once https://github.com/NixOS/nixpkgs/pull/312449 is merged
    #nixpkgs.url = "github:ymstnt/nixpkgs/pantheon-8-on-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-develop.url = "github:ymstnt/nixpkgs/master";
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/stable.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
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
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    winapps = {
      url = "github:winapps-org/winapps/feat-nix-packaging";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lix-module, home-manager, winapps, ... } @inputs: {
    nixosConfigurations =
      let
        #inherit (self) outputs;
        mkSystem = host: nixpkgs.lib.nixosSystem {
          modules = [
            ./overlays
            lix-module.nixosModules.lixFromNixpkgs
            home-manager.nixosModule
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
