{
  pkgs,
  myVars,
  ...
} @ args: {

  # Auto upgrade nix
  nix.package = pkgs.nixVersions.latest;

  environment.systemPackages = with pkgs; [
    git
    git-lfs

    # Archives
    zip
    xz
    zstd
    unzipNLS
    p7zip

    # Text processing
    gnugrep
    gnused
    gawk
    jq

    # Networking tools
    wget
    curl
    dnsutils

    # misc
    file
    findutils
    usbutils
    which
    tree
    gnutar
    rsync
    ncdu # disk usage utility
  ];

  users.users.${myVars.username} = {
    description = myVars.name;

    #openssh.authorizedKeys.keys = [];
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];

    trusted-users = [myVars.username];
  };
}
