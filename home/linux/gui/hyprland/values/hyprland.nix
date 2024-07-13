{
  pkgs,
  lib,
  inputs,
  ...
}:
let
  hyprland = inputs.hyprland;
  package = hyprland.packages.${pkgs.system}.hyprland;
in {
  wayland.windowManager.hyprland = {
    inherit package;
    # TODO: hyprland configs go here
  };
}
