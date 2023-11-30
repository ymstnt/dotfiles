{
  description = "ymstnt's NixOS configuration";

  # This is the standard format for flake.nix.
  # `inputs` are the dependencies of the flake,
  # and `outputs` function will return all the build results of the flake.
  # Each item in `inputs` will be passed as a parameter to
  # the `outputs` function after being pulled and built.
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

  outputs =
    { self
    , nixpkgs
    , home-manager
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      # Supported systems for your flake packages, shell, etc.
      systems = [
        "x86_64-linux"
      ];
      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      #packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      overlays = import ./overlays { inherit inputs; };
      nixosConfigurations = {
        "andromeda" = nixpkgs.lib.nixosSystem {
          modules = [
            ./default.nix
            ./hosts/andromeda/default.nix
            home-manager.nixosModules.home-manager
          ];
          specialArgs = { inherit inputs outputs; };
        };
        "cassiopeia" = nixpkgs.lib.nixosSystem {
          modules = [
            ./default.nix
            ./hosts/cassiopeia/default.nix
            home-manager.nixosModules.home-manager
          ];
          specialArgs = { inherit inputs outputs; };
        };
      };
    };
}
