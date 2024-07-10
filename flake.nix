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

  outputs = {...} @ inputs:
  let 
    lib = inputs.nixpkgs.lib;

    myLib = import ./lib { inherit lib; };
    myVars = import ./vars { inherit lib; };

    args = {inherit inputs lib myLib myVars;};

  in {
    nixosConfigurations = {
      default = lib.nixosSystem {
        specialArgs = args;

        modules = [
          ./hosts/default
        ];
      };

    };

    homeConfigurations = {
      ruan = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs;
        extraSpecialArgs = args;
        modules = [
          ./home/linux/core.nix
        ];
      };
    };
  };
}
