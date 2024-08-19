
{
  pkgs,
  config,
  myLib,
  ...
}: {
  config.programs.wofi = {
    enable = true;
  };

  config.home.packages = with pkgs; [ ];
}
