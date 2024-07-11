{pkgs, ...}: {
  home.packages = with pkgs; [
    hoppscotch # FOSS REST client
  ];
}
