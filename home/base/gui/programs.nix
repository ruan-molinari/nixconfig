{ 
  pkgs,
  lib,
  ...
}: {

  home.packages = with pkgs; [
    vesktop
    spotify-unwrapped
  ];
}
