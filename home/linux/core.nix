{ ... }: {
  imports = [
    ../base/core
    ../base/home.nix

    ./base
  ];

  services.kanshi = {
    enable = true;
    profile = {
      name = "home";
      outputs = [
        {
          criteria = "HDMI-A-1";
          mode = "2560x1440@75Hz";
          position = "0,0";
        }
      ];
    };
  };
}
