{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming"; # gaming related stuff

    # anyrun - a wayland launcher
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # themes for alacritty
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, nix-colors, ... } @inputs:
  let 

    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${"x86_64-linux"};

    myLib = import ./lib { inherit lib; };
    myVars = import ./vars { inherit lib; };

    args = {inherit inputs myLib myVars nix-colors;};

  in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = args;

        modules = [
          ./hosts/linux/desktop
        ];
      };

    };

    homeConfigurations = {
      ruan = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = args;
        modules = [
          ./home/linux/gui.nix
        ];
      };
    };
  };
}
