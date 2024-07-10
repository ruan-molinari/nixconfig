{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake"; # hardware input remapping

    nix-gaming.url = "github:fufexan/nix-gaming"; # gaming related stuff
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
  let 
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${"x86_64-linux"};

    myLib = import ./lib { inherit lib; };
    myVars = import ./vars { inherit lib; };

    args = {inherit inputs myLib myVars;};

  in {
    nixosConfigurations = {
      default = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = args;

        modules = [
          ./hosts/default
        ];
      };

    };

    homeConfigurations = {
      ruan = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = args;
        modules = [
          ./home/linux/core.nix
        ];
      };
    };
  };
}
