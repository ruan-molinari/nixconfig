{ pkgs
, ...
}: {
  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kanshi}/bin/kanshi";
    };
  };

  environment.systemPackages = with pkgs; [
    kanshi
  ];
}
