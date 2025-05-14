{ pkgs-unstable
, pkgs
, lib
, ...
}: {
  home.packages = [
    pkgs-unstable.prismlauncher # minecraft launcher
    pkgs-unstable.shadps4
    pkgs-unstable.r2modman # unofficial thunderstore mod manager client
    pkgs-unstable.lutris-free
    pkgs-unstable.bottles

    pkgs.wowup-cf # declared on unfree.nix
  ];

}
