{ pkgs
, config
, lib
, myLib
, inputs
, ...
}:
let
  modKey = "Alt";
in
{
  imports = myLib.scanPaths ./.;

  config.home.packages = with pkgs; [
    ristate
    wideriver
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
          "kanshi"
        ];
        keyboard-layout = "'us(dvorak)'";

        # Adds server-side rendering decorations.
        # Required by wideriver to display borders on all windows.
        rule-add = "ssd";

        default-layout = "wideriver";

        map.normal."Alt Return" = "spawn alacritty";
        map.normal."Super Space" = "spawn 'fuzzel'";

        map.normal."Alt Tab" = "keyboard-layout 'us(dvorak)'";
        map.normal."Alt A" = "keyboard-layout 'us'";

        map.normal."Super Q" = "close";
        map.normal."Super+Shift E" = "exit";

        map.normal."Super F" = "toggle-float";
        map.normal."Super Tab" = "focus-view next";
        map.normal."Super+Shift Tab" = "focus-view previous";

        map.normal."Super+Alt H" = "focus-output left";
        map.normal."Super+Alt L" = "focus-output right";

        map.normal."Super+Alt+Control H" = "send-to-output left";
        map.normal."Super+Alt+Control L" = "send-to-output right";

        # Super+Alt+{H,J,K,L} to move views
        map.normal."Super H" = "focus-view left";
        map.normal."Super J" = "focus-view down";
        map.normal."Super K" = "focus-view up";
        map.normal."Super L" = "focus-view right";

        # Super+Alt+{H,J,K,L} to move views
        #map.normal."Super+Alt H" = "move left 100";
        #map.normal."Super+Alt J" = "move down 100";
        #map.normal."Super+Alt K" = "move up 100";
        #map.normal."Super+Alt L" = "move right 100";

        # Alt+Shift+{H,J,K,L} to snap views to screen edges
        map.normal."Super+Shift H" = "snap left";
        map.normal."Super+Shift J" = "snap down";
        map.normal."Super+Shift K" = "snap up";
        map.normal."Super+Shift L" = "snap right";

        # Super+Alt+Shift+{H,J,K,L} to resize views
        map.normal."Super+Alt+Shift H" = "resize horizontal -100";
        map.normal."Super+Alt+Shift J" = "resize vertical 100";
        map.normal."Super+Alt+Shift K" = "resize vertical -100";
        map.normal."Super+Alt+Shift L" = "resize horizontal 100";

        #map-pointer.normal."Super+Shift SCROLL_UP" = "resize vertical 100";
        #map-pointer.normal."Super+Shift SCROLL_DOWN" = "resize vertical -100";
        #map-pointer.normal."Super+Control SCROLL_UP" = "resize horizontal 100";
        #map-pointer.normal."Super+Control SCROLL_DOWN" = "resize horizontal -100";

        map-pointer.normal."Super BTN_LEFT" = "move-view";
        map-pointer.normal."Super BTN_RIGHT" = "resize-window";
      };

      extraConfig = ''
        for i in {1..9}; do
          riverctl map normal Super $i set-focused-tags $((1 << $(($i - 1))))
          riverctl map normal Super+Shift $i set-view-tags $((1 << $(($i - 1))))
          riverctl map normal Super+Control $i toggle-focused-tags $((1 << $(($i - 1))))
          riverctl map normal Super+Control+Shift $i toggle-view-tags $((1 << $(($i - 1))))
        done

        # Various media key mapping examples for both normal and locked mode which do
        # not have a modifier
        for mode in normal locked
        do
            # Eject the optical drive (well if you still have one that is)
            riverctl map $mode None XF86Eject spawn 'eject -T'
          
            # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
            riverctl map $mode None XF86AudioRaiseVolume  spawn 'pamixer -i 5'
            riverctl map $mode None XF86AudioLowerVolume  spawn 'pamixer -d 5'
            riverctl map $mode None XF86AudioMute         spawn 'pamixer --toggle-mute'
          
            # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
            riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
            riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
            riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
            riverctl map $mode None XF86AudioNext  spawn 'playerctl next'
          
            # Control screen backlight brightness with brightnessctl (https://github.com/Hummer12007/brightnessctl)
            riverctl map $mode None XF86MonBrightnessUp   spawn 'brightnessctl set +5%'
            riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 5%-'
        done

        wideriver \
          --layout right \
          --layout-alt monocle \
          --stack dwindle \
          --count-master 1 \
          --ratio-master 0.50 \
          --count-wide-left 0 \
          --ratio-wide 0.35 \
          --inner-gaps 5 \
          --outer-gaps 10 \
          --border-width 2 \
          --border-width-monocle 0 \
          --border-color-focused 0xc4a7e7 \
          --border-color-unfocused 0x21202e \
          --log-threshold info &

        eww daemon &
        eww open bar &
      '';
    };
  };

}
