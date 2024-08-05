{
  pkgs,
  config,
  lib,
  myLib,
  inputs,
  ...
}:
let
  modKey = "Alt";
in {
  imports = myLib.scanPaths ./.;

  options.display.river.enable = true;

  config = { 
    wayland.windowManager.river = {
      enable = true;
      xwayland.enable = true;

      extraSessionVariables = { WLR_NO_HARDWARE_CURSORS = "1"; };

      settings = {
        map.normal."${modKey} Return" = "spawn alacritty";
        map.normal."${modKey} Space" = "spawn 'rofi --show run'";

        map.normal."${modKey} w" = "close";
        map.normal."${modKey} q" = "exit";
      };

      extraConfig = ''
        riverctl spawn waybar

        for i in {1..9}; do
          riverctl map normal ${modKey} $i set-focused-tags $((1 << $(($i - 1))))
          riverctl map normal ${modKey}+Shift $i set-view-tags $((1 << $(($i - 1))))
          riverctl map normal ${modKey}+Control $i toggle-focused-tags $((1 << $(($i - 1))))
          riverctl map normal ${modKey}+Control+Shift $i toggle-view-tags $((1 << $(($i - 1))))
        done
        '';
    };

    programs = {
      rofi.enable = true;
      waybar = {
        enable = true;
      };
    };
  };

  config.home.packages = with pkgs; [
  ];
}
