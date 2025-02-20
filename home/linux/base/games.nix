{ pkgs
, lib
, ...
}: {
  home.packages = with pkgs; [
    prismlauncher # minecraft launcher
    wowup-cf
    shadps4
  ];

}
