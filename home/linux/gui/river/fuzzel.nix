{
  pkgs,
  config,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      colors = {
        background = "${config.colorScheme.palette.base00}aa";
        text = "${config.colorScheme.palette.base05}ff";
        match = "${config.colorScheme.palette.base0C}ff";
        selection = "${config.colorScheme.palette.base02}aa";
        selection-text = "${config.colorScheme.palette.base0D}ff";
        selection-match = "${config.colorScheme.palette.base0B}ff";
        border = "${config.colorScheme.palette.base0F}ff";
      };
    };
  };
}
