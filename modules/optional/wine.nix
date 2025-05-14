{
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs-unstable; [
    wineWowPackages.waylandFull
    (wine-staging.override { wineBuild = "wine64"; })
    wine64

  ];
}
