{ myLib, ... }: {
  imports = myLib.scanPaths ./.;
}