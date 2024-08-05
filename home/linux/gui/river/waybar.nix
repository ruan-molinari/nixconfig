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
        border: none;
        font-family: 'Fira Code', 'Symbols Nerd Font Mono';
        font-size: 16px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 45px;
      }

      window#waybar {
        background: transparent;
      }

      #custom-arch, #workspaces {
        border-radius: 10px;
        background-color: #11111b;
        color: #b4befe;
        margin-top: 15px;
        margin-right: 15px;
        padding-top: 1px;
        padding-left: 10px;
        padding-right: 10px;
      }

      #custom-arch {
        font-size: 20px;
        margin-left: 15px;
        color: #b4befe;
      }

      #workspaces button {
        background: #11111b;
        color: #b4befe;
      }

      #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery{
        border-radius: 10px;
        background-color: #11111b;
        color: #cdd6f4;
        margin-top: 15px;
        padding-left: 10px;
        padding-right: 10px;
        margin-right: 15px;
      }
      
      #backlight, #bluetooth {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
        padding-right: 5px;
        margin-right: 0
      }
      
      #pulseaudio, #network {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
        padding-left: 5px;
      }
      
      #clock {
        margin-right: 0;
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
}];
};
}
