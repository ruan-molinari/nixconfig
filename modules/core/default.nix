{ config
, pkgs
, pkgs-unstable
, inputs
, myVars
, myLib
, ...
}: {
  imports = myLib.scanPaths ./.;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = myVars.username;

  networking.networkmanager.enable = true;

  services.blueman.enable = true;
  services.printing.enable = true;
  services.flatpak.enable = true;
  services.ratbagd.enable = true;
  services.input-remapper.enable = true;
  services.passSecretService.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
    options = "grp:win_space_toggle";
  };

  console.useXkbConfig = true;

  users.defaultUserShell = pkgs-unstable.nushell;
  environment.shells = with pkgs-unstable; [ nushell ];

  programs.nix-ld.enable = true;

  users.users.${myVars.username} = {
    isNormalUser = true;
    description = myVars.name;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      # tools
      usbutils
      appimage-run
      codecrafters-cli

      # dev tools
      redis
      lazygit

      # libs
      readline
      zlib
      zlib.dev
      libratbag # Configuration library for gaming mice

      pkg-config # needed for openssl
      openssl # needed for rust
      openssl.dev

      
      # TODO: move programming language config to a separate file/module
      # Programming languages/LSPs/tools
      cargo
      rustup
      zig
      zls
      go
      # odin
      # ols

      (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.pip
        python-pkgs.pandas
        python-pkgs.requests
      ]))

      nodejs_20
      bun

    ];
  };
}
