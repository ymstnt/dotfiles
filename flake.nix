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
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
      inputs.darwin.follows = "";
    };
    nixpkgs-patch-hytale-launcher = {
      url = "https://github.com/NixOS/nixpkgs/pull/479368.diff";
      flake = false;
    };
    # TODO: remove after https://github.com/NixOS/nixpkgs/issues/483540
    nixpkgs-kdenlive.url = "github:NixOS/nixpkgs/9d3f216d67d8a33c7171c72e030f0ffb14cf886c";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-patcher,
      home-manager,
      cosmic-manager,
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
