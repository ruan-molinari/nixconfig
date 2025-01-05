{ config, pkgs, lib, ... }: {

  security.polkit.enable = true;

  systemd.extraConfig = ''
    DefaultLimitNOFILE=4096
    DefaultEnvironment="PATH=/run/current-system/sw/bin"
  '';

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all
  '';

  xdg.portal.enable = true;

  programs = {
    river = {
      enable = true;
      xwayland.enable = true;

      extraPackages = with pkgs; [
        kanshi
      ];
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
