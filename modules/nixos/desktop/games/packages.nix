{
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs-unstable; [
    bottles
    protontricks
    protonup-qt
    lutris-free
  ];
}
