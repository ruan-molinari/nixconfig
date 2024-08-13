{ 
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;

    style = ''
      @define-color base            #${config.colorScheme.palette.base00};
      @define-color surface         #${config.colorScheme.palette.base01};
      @define-color overlay         #${config.colorScheme.palette.base02};

      @define-color muted           #${config.colorScheme.palette.base03};
      @define-color subtle          #${config.colorScheme.palette.base04};
      @define-color text            #${config.colorScheme.palette.base05};

      @define-color love            #${config.colorScheme.palette.base08};
      @define-color gold            #${config.colorScheme.palette.base09};
      @define-color rose            #${config.colorScheme.palette.base0A};
      @define-color pine            #${config.colorScheme.palette.base0B};
      @define-color foam            #${config.colorScheme.palette.base0C};
      @define-color iris            #${config.colorScheme.palette.base0D};

      @define-color highlightLow    #21202e;
      @define-color highlightMed    #403d52;
      @define-color highlightHigh   #${config.colorScheme.palette.base0F};

      * {
        min-height: 0;
        font-family: "CaskaydiaMono Nerd Font Mono";
        font-weight: 500;
      }

      window#waybar {
        transition-property: background-color;
        transition-duration: 0.5s;
        background-color: alpha(@base, 0.6);
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
        background-color: @base;
        color: @muted;
      }

      #tags button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background-color: @surface;
        color: @subtle;
      }

      #tags button:active {
        background-color: @overlay;
        color: @text;
      }

      #tags button.focused {
        background-color: @overlay;
        color: @text;
        border: 1px solid @subtle;
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
        border-radius: 8px;
        margin: 4px 4px;
        background-color: @base;
      }

      #custom-power {
        color: @love;
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
        "format" = "⏻ ";
      };
    }];
  };
}
