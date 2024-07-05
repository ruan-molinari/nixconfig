{
  pkgs,
  myvars,
  ...
} @ args: {

  # Auto upgrade nix
  nix.package = pkgs.nixVersion.latest;

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
  ];

  users.users.${myvars.username} = {
    description = myvars.name;

    openssh.authorizedKeys.keys = [];
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];

    trusted-users = [myvars.username];

  };
}
