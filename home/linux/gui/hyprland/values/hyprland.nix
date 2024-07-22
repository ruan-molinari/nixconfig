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
    settings = {
      env = [
        "NIXOS_OZONE_WL,1" # for any ozone-based browser & electron apps to run on wayland

        # firefox is crashing on nvidia 555 driver when wayland mode is on
        #"MOZ_ENABLE_WAYLAND,1" # for firefox to run on wayland 
        "MOZ_WEBRENDER,1"
        # misc
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORM,wayland"
        "SDL_VIDEODRIVER,wayland"
        "GDK_BACKEND,wayland"

        # nvidia
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        # fix https://github.com/hyprwm/Hyprland/issues/1520
        "WLR_NO_HARDWARE_CURSORS,1"
      ];
    };
  };
}
