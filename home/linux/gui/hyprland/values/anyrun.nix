{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs.anyrun = {
    enable = true;
    config = {
      plugins =  with inputs.anyrun.packages.${pkgs.system}; [
        applications
        randr
        rink
        shell
        symbols
        translate
      ];

      width.fraction = 0.5;
      y.absolute = 15;
      hidePluginInfo = true;
      closeOnClick = true;
    };


    extraCss = ''
        @define-color bg-col #${config.colorScheme.palette.base00};
        @define-color bg-col-light #${config.colorScheme.palette.base07};
        @define-color border-col #${config.colorScheme.palette.base04};
        @define-color selected-col #${config.colorScheme.palette.base0F};
        @define-color fg-col #${config.colorScheme.palette.base05};
        @define-color fg-col2 #${config.colorScheme.palette.base06};

        * {
          transition: 200ms ease;
          font-family: "JetBrainsMono Nerd Font";
          font-size: 1.3rem;
        }

        #window {
          background: transparent;
        }

        #plugin,
        #main {
          border: 3px solid @border-col;
          color: @fg-col;
          background-color: @bg-col;
        }
        /* anyrun's input window - Text */
        #entry {
          color: @fg-col;
          background-color: @bg-col;
        }

        /* anyrun's ouput matches entries - Base */
        #match {
          color: @fg-col;
          background: @bg-col;
        }

        /* anyrun's selected entry */
        #match:selected {
          color: @fg-col2;
          background: @selected-col;
        }

        #match {
          padding: 3px;
          border-radius: 16px;
        }

        #entry, #plugin:hover {
          border-radius: 16px;
        }

        box#main {
          background: rgba(30, 30, 46, 0.7);
          border: 1px solid @border-col;
          border-radius: 15px;
          padding: 5px;
        }
      '';
  };
}
