{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming"; # gaming related stuff

    # themes for alacritty
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

    nix-colors.url = "github:misterio77/nix-colors";

    # zen browser flake
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    xdg-luminous.url = "github:waycrate/xdg-desktop-portal-luminous";

    # animated wallpaper engine for wayland
    swww.url = "github:LGFae/swww";

    # mix packages (mainly installed for proton vpn)
    erosanix.url = "github:emmanuelrosa/erosanix";

    # gotta look at it more carefully
    #impermanence.url = "github:nix-community/impermanence";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, xdg-luminous, home-manager, nix-colors, erosanix, ... } @inputs:
    let
      system = "x86_64-linux";
  
      pkgs = import nixpkgs rec {
        inherit system;
        overlays = [ ];
      };

      pkgs-unstable = import nixpkgs-unstable rec {
        inherit system;
        overlays = [ ];
      };

      lib = nixpkgs.lib;

      myLib = import ./lib { inherit lib; };
      myVars = import ./vars { inherit lib; };

      args = { inherit inputs myLib myVars erosanix xdg-luminous; };
      hmArgs = { inherit inputs myLib myVars nix-colors; };

    in
    {
      nixosConfigurations = {
        desktop = lib.nixosSystem {
          inherit system;
          specialArgs = args;

          modules = [
            ./hosts/linux/desktop
          ];
        };

      };

      homeConfigurations = {
        ruan = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = hmArgs;
          modules = [
            ./home/linux/gui.nix
          ];
        };
      };
    };
}
