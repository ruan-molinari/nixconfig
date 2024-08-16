{ config, pkgs, lib, ...}: {

  security.polkit.enable = true;

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  xdg.portal.enable = true;

  programs.river.enable = true;
}
