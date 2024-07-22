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
    '';

    settings = [{
        "layer" = "top";
        "position" = "top";
        modules-left = [
         "hyprland/workspaces"
         "hyprland/submap"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "backlight"
          "memory"
          "cpu"
          "network"
          "custom/powermenu"
          "tray"
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
          "tooltip" = true;
          "tooltip-format"= "{=%A; %d %B %Y}\n<tt>{calendar}</tt>";
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
      }];
  };
}
