{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bottles
    protontricks
    protonup-qt
  ];
}
