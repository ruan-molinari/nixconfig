{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
    } @inputs: let 
      inherit (inputs.nixpkgs) lib;
      mylib = import ./lib { inherit lib; };
      myvars = import ./vars { inherit lib; };

      # Add my custom lib, vars, nixpkgs instance, and all the inputs to specialArgs,
      # so that I can use them in all my nixos/home-manager/darwin modules.
      genSpecialArgs = system:
        inputs
        // {
          inherit mylib myvars;

          # use unstable branch for some packages to get the latest updates
          pkgs-unstable = import inputs.nixpkgs-unstable {
            inherit system; # refer the `system` parameter form outer scope recursively
            config.allowUnfree = true;
          };
        };

      systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos";
        timezone = "America/Sao_Paulo";
        locale = "en_US.UTF-8";
      };

      userSettings = {
        username = "ruan";
        githubUser = "ruan-molinari";
        name = "Ruan";
        email = "ruan.molinari@proton.me";
        editor = "nvim";
      };


      system = systemSettings.system;
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in {
      nixosConfigurations = {
        default = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [
            ./hosts/default
          ];
        };
      };

      homeConfigurations = {
        ruan = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
            inherit systemSettings;
            inherit userSettings;
            inherit mylib;
            inherit myvars;
          };
          modules = [
            ./users/ruan/home.nix
            ./home/linux/core.nix
          ];
        };
      };
    };
}
