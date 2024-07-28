{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [];

  options.river.enable = true;

  config.wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
  };

  config.home.packages = with pkgs; [];
}
