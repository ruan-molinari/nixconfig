{ ... }: {
  config.services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "home";
        profile.outputs = [
          {
            criteria = "DP-3";
            mode = "2560x1440@240Hz";
            position = "0,0";
          }
          {
            criteria = "HDMI-A-2";
            mode = "2560x1440@75Hz";
            position = "2570,0";
          }
        ];
      }
    ];
  };
}
