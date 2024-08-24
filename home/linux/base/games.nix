{ pkgs
, lib
, ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "wowup-cf" # wow addon manager
  ];

  home.packages = with pkgs; [
    prismlauncher # minecraft launcher
    wowup-cf
  ];

}
