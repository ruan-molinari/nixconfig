{pkgs, ...}: {
  home.pkgs = with pkgs; [
    hoppscotch # FOSS REST client
  ];
}
