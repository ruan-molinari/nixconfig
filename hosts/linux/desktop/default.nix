# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ myLib, pkgs, config, ... }:
{
  imports =
    myLib.scanPaths ./.
      ++ map myLib.relativeToRoot [
      "modules"
      "modules/nixos/desktop.nix"
    ];

  services.xserver.enable = true;

  hardware.graphics = {
      # Enables the graphics driver for OpenGL
      enable = true;
      extraPackages = with pkgs; [ vaapiVdpau ];
  };

  # Load default nvidia drivers for Xorg and wayland
  services.xserver.videoDrivers = [ "nvidia" ];
   
  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
