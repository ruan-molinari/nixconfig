{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 0;
  };
}
