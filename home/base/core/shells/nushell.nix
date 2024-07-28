{pkgs, myLib, ...}: {
  programs.nushell = {
    enable = true;
    configFile.source = myLib.relativeToDotfiles "nushell/config.nu";
    envFile.source = myLib.relativeToDotfiles "nushell/env.nu";
  };
}
