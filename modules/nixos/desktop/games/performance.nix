{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mangohud
  ];

  programs = {
    gamescope.enable = true;
  };
}
