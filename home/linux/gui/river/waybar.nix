{ 
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;

    style = ''

      * {
        min-height: 0;
        font-size: 14px;
        font-family: "CaskaydiaMono Nerd Font Mono";
        font-weight: 500;
      }

      window#waybar {
        transition-property: background-color;
        transition-duration: 0.5s;
        background-color: alpha(@theme_bg_color, 0.6);
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #tags {
        background-color: transparent;
      }

      #tags button {
        all: initial;
        min-width: 0;
        box-shadow: inset 0 -3px transparent;
        padding: 2px 10px;
        min-height: 0;
        margin: 4px;
        border-radius: 8px;
        background-color: @theme_bg_color;
        color: @theme_fg_color;
        border: 1px solid alpha(@theme_fg_color, 0.1);
      }

      #tags button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background-color: @theme_unfocused_bg_color;
        color: @theme_unfocused_fg_color;
      }

      #tags button:active {
        background-color: @theme_bg_color;
        color: @theme_fg_color;
      }

      #tags button.focused {
        background-color: @theme_bg_color;
        color: @theme_fg_color;
        border: 1px solid @theme_fg_color;
      }

      #clock,
      #pulseaudio,
      #custom-logo,
      #custom-power,
      #cpu,
      #tray,
      #memory,
      #network,
      #window {
        min-height: 0;
        padding: 2px 10px;
        border: 1px solid alpha(@theme_fg_color, 0.1);
        border-radius: 8px;
        margin: 4px 4px;
        background-color: @theme_bg_color;
      }

      #custom-power {
        color: @error_color;
      }

    '';

    settings = [{
      "layer" = "top";
      "position" = "top";
      modules-left = [
        "river/tags"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "pulseaudio"
        "memory"
        "cpu"
        "network"
        "custom/powermenu"
        "tray"
        "custom/power"
      ];
      "custom/cava-internal" = {
        "exec" = "sleep 1s && cava-internal";
        "tooltip" = false;
      };
      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = {
          "default" = [ "" "" "" ];
        };
        "on-click" = "pamixer -t";
        "tooltip" = false;
      };
      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p  %A %b %d}";
      };
      "memory" = {
        "interval" = 1;
        "format" = "󰻠 {percentage}%";
        "states" = {
          "warning" = 85;
        };
      };
      "cpu" = {
        "interval" = 1;
        "format" = "󰍛 {usage}%";
      };
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰒢 Connected!";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        "tooltip" = false;
      };
      "tray" = {
        "icon-size" = 15;
        "spacing" = 5;
      };
      "custom/power" = {
        "tooltip" = false;
        "on-click" = "exec rofi -show power-menu";
        "format" = "⏻";
      };
    }];
  };
}
