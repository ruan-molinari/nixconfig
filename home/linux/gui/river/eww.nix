{ pkgs
, myLib
, ...
}: {
  programs.eww = {
    enable = true;
    configDir = myLib.relativeToDotfiles "eww";
  };
}
