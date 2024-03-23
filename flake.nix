{
  description = "ymstnt's NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://ymstnt-nixfiles.cachix.org"
    ];
    extra-trusted-public-keys = [
      "ymstnt-nixfiles.cachix.org-1:7G6HhsJHEAWXLxD9t2VALLpX2jIgbWZK+muzvoUNUHg="
    ];
  };
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-develop.url = "github:ymstnt/nixpkgs/master";
    nixpkgs-develop-fcast.url = "github:ymstnt/nixpkgs/init-fcast"; # TODO: remove once https://github.com/NixOS/nixpkgs/pull/283513 is merged
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
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: {
    nixosConfigurations =
      let
        #inherit (self) outputs;
        mkSystem = host: nixpkgs.lib.nixosSystem {
          modules = [
            ./overlays
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
