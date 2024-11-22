{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    wayland-scanner
    pkg-config
    lswt
  ];
}
