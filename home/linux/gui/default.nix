{ myLib, ... }: {
  imports = myLib.scanPaths ./.;
}
