{
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs-unstable; [
    wineWowPackages.waylandFull
    (wine.override { wineBuild = "wine64"; })
    wine64

  ];
}
