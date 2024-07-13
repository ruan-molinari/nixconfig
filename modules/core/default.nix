{
  config,
  pkgs,
  inputs,
  myVars,
  ...
}: {
  imports = [
    ./audio.nix
    ./nix.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = myVars.username;

  networking.networkmanager.enable = true;

  services.blueman.enable = true;
  services.printing.enable = true;
  services.flatpak.enable = true;
  services.ratbagd.enable = true;
  services.input-remapper.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
  };

  console.useXkbConfig = true;
  
  programs.nix-ld.enable = true;

  users.users.${myVars.username} = {
    isNormalUser = true;
    description = myVars.name;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      nerdfonts
      usbutils
      appimage-run
      readline
      zlib
      zlib.dev

      pkg-config # needed for openssl
      openssl # needed for rust
      openssl.dev
          
      libratbag # Configuration library for gaming mice
      piper # GTK frontend for libratbag mouse config daemon

      # TODO: move programming language config to a separate file/module
      # Programming languages/LSPs/tools
      cargo
      rustup
      # zig
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

      (with dotnetCorePackages; combinePackages [
       sdk_7_0_3xx
      ])
    ];
  };
}
