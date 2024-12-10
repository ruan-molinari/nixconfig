# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ myLib, pkgs, config, ... }:
{
  imports =
    myLib.scanPaths ./.
    ++ map myLib.relativeToRoot [
      "modules/nixos/desktop.nix"

      "modules/optional/keyd.nix"
    ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.xserver.enable = true;
}
