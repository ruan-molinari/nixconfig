{ pkgs
, lib
, config
, myVars
, inputs
, xdg-luminous
, ...
}:
with lib; let
  cfgWayland = config.modules.desktop.wayland;
  cfgXorg = config.modules.desktop.xorg;
in
{
  imports = [
    ./base
    ../base.nix

    ./desktop
    ../optional/protonvpn.nix
    ../optional/wine.nix
  ];

  options.modules.desktop = {
    wayland = {
      enable = true;
      #enable = mkEnableOption "Wayland Display Server";
    };
    xorg = {
      enable = mkEnableOption "Xorg Display Server";
    };
  };

  config = {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        xdg-luminous
      ];
    };
  };
}
