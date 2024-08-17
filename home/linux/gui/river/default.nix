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

  config.home.packages = with pkgs; [
    river-bsp-layout
  ];

  options.display.river.enable = true;

  config = { 
    wayland.windowManager.river = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;

      extraSessionVariables = { WLR_NO_HARDWARE_CURSORS = "1"; XDG_CURRENT_DESKTOP = "river"; };

      settings = {
        spawn = [
          "waybar"
        ];
        keyboard-layout = "'us(dvorak)'";
        default-layout = "bsp-layout";

        map.normal."Super Return" = "spawn alacritty";
        map.normal."Alt Space" = "spawn 'rofi -show run'";

        map.normal."Super Tab" = "spawn \"riverctl keyboard-layout 'us(dvorak)'\"";
        map.normal."Super A" = "spawn \"riverctl keyboard-layout 'us'\"";

        # Super+Alt+{H,J,K,L} to move views
        map.normal."Alt H" = "focus-view left";
        map.normal."Alt J" = "focus-view down";
        map.normal."Alt K" = "focus-view up";
        map.normal."Alt L" = "focus-view right";

        # Super+Alt+{H,J,K,L} to move views
        map.normal."Super+Alt H" = "move left 100";
        map.normal."Super+Alt J" = "move down 100";
        map.normal."Super+Alt K" = "move up 100";
        map.normal."Super+Alt L" = "move right 100";
        
        # Alt+Shift+{H,J,K,L} to snap views to screen edges
        map.normal."Alt+Shift H" = "snap left";
        map.normal."Alt+Shift J" = "snap down";
        map.normal."Alt+Shift K" = "snap up";
        map.normal."Alt+Shift L" = "snap right";
        
        # Super+Alt+Shift+{H,J,K,L} to resize views
        map.normal."Super+Alt+Shift H" = "resize horizontal -100";
        map.normal."Super+Alt+Shift J" = "resize vertical 100";
        map.normal."Super+Alt+Shift K" = "resize vertical -100";
        map.normal."Super+Alt+Shift L" = "resize horizontal 100";

        map-pointer.normal."Alt BTN_LEFT" = "move-view";
        map-pointer.normal."Alt BTN_RIGHT" = "resize-window";
        map-pointer.normal."Alt BTN_MIDDLE" = "toggle-float";
      };

      extraConfig = ''
          for i in {1..9}; do
            riverctl map normal ${modKey} $i set-focused-tags $((1 << $(($i - 1))))
            riverctl map normal ${modKey}+Shift $i set-view-tags $((1 << $(($i - 1))))
            riverctl map normal ${modKey}+Control $i toggle-focused-tags $((1 << $(($i - 1))))
            riverctl map normal ${modKey}+Control+Shift $i toggle-view-tags $((1 << $(($i - 1))))
          done

          river-bsp-layout --inner-gap 5 --outer-gap 10 &
        '';
    };
  };

}
