{
  description = "ymstnt's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-develop.url = "github:ymstnt/nixpkgs/master";
    nixpkgs-patcher.url = "github:gepbird/nixpkgs-patcher";
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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "";
    };
    nixpkgs-brave-origin.url = "https://github.com/NixOS/nixpkgs/archive/refs/pull/513143/head.tar.gz";
    nixpkgs-patch-hytale-launcher = {
      url = "https://github.com/NixOS/nixpkgs/pull/479368.diff";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-patcher,
      home-manager,
      cosmic-manager,
      sops-nix,
      ...
    }@inputs:
    {
      nixosConfigurations =
        let
          #inherit (self) outputs;
          mkSystem =
            host:
            nixpkgs-patcher.lib.nixosSystem {
              modules = [
                ./overlays
                home-manager.nixosModules.default
                sops-nix.nixosModules.sops
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
