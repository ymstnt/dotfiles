{
  description = "ymstnt's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-develop.url = "github:ymstnt/nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: {
    overlays = import ./overlays { inherit inputs; };
    nixosConfigurations =
      let
        inherit (self) outputs;
        mkSystem = host: nixpkgs.lib.nixosSystem {
          modules = [
            home-manager.nixosModules
            host
            ./default.nix
          ];
        };
      in
      {
        andromeda = mkSystem ./hosts/andromeda;
        cassiopeia = mkSystem ./hosts/cassiopeia;
      };
  };
}
