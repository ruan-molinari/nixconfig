{pkgs, myLib, ...}: {
  imports = myLib.scanPaths ./.;

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
