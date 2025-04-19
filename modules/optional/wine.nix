{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wineWowPackages.waylandFull
    (wine.override { wineBuild = "wine64"; })
    wine64

  ];
}
