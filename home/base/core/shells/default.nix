{pkgs, mylib, ...}: {
  imports = mylib.scanPaths ./.;

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
