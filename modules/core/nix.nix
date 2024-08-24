{ ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = rec {
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  system.stateVersion = "24.11";
}
