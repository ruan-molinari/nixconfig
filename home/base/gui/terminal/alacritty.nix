{pkgs, ...}: {

  programs.alacritty = {
    enable = true;

    settings = {
      live_config_reload = true;

      window = {
        decorations = "None";
        opacity = 0.8;
        blur = true;
      };
    };

  };
}
