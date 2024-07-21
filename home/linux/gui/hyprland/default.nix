{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
let 
  hyprland-pkgs = inputs.hyprland.packages.${pkgs.system};
  hyprland-plugins = inputs.hyprland-plugins.packages.${pkgs.system};
in {
  imports = [
    inputs.anyrun.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default

    ./values
  ];

  options.modules.desktop.hyprland = {
    enable = true;

    package = hyprland-pkgs;
    xwayland.enable = true;
    nvidia = true;

    settings = {
      "$mod" = "SUPER";
    };
  };

  config.wayland.windowManager.hyprland.settings.env = [
    # for hyprland with nvidia gpu, ref https://wiki.hyprland.org/Nvidia/
    "LIBVA_DRIVER_NAME,nvidia"
    "XDG_SESSION_TYPE,wayland"
    "GBM_BACKEND,nvidia-drm"
    "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    # fix https://github.com/hyprwm/Hyprland/issues/1520
    "WLR_NO_HARDWARE_CURSORS,1"
  ];

  config.home.packages = (with hyprland-pkgs; [
    
  ]) ++ (with pkgs; [
    
  ]);
}
