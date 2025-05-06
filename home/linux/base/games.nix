{ pkgs-unstable
, lib
, ...
}: {
  home.packages = with pkgs-unstable; [
    prismlauncher # minecraft launcher
    shadps4
    r2modman # unofficial thunderstore mod manager client
    # wowup-cf # declared on unfree.nix
  ];

}
