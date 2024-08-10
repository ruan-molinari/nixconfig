{
  pkgs,
  config,
  myLib,
  ...
}: {
  config.programs.rofi = {
    enable = true;
    extraConfig =  {
        /*------- General settings -------*/
        modi = "drun,run,filebrowser,window";
        case-sensitive = false;
        cycle = true;
        normalize-match = true;
        show-icons = true;
        icon-theme = "Papirus";
        steal-focus = false;
      
        /*------- Matching setting -------*/
        matching = "normal";
        tokenize = true;
      
        /*------- Keybindings -------*/
        kb-row-up = "Control+p";
        kb-row-down = "Control+n";
      };
  };

  config.home.packages = with pkgs; [
      rofi-power-menu
  ];
}
