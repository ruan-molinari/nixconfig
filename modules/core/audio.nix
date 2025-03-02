{ config
, pkgs
, ...
}: {
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire-pulse = {
      "block-mic-gain-control" = {
        "pulse.rules" = [
          {
            matches = [
              { "application.process.binary" = "chrome"; }
              { "application.process.binary" = "electron"; }
              { "application.process.binary" = "firefox"; }
              { "application.process.binary" = "Discord"; }
            ];
            actions = {
              quirks = [
                "block-source-volume"
              ];
            };
          }
        ];
      };
    };
  };

  services.mpd.enable = true;

  environment.systemPackages = with pkgs; [
    alsa-utils
    mpc-cli
  ];
}
