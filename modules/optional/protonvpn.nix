{ pkgs
, myVars
, erosanix
, ...
}: {

  imports = [
    erosanix.nixosModules.protonvpn
  ];
  
  users.users.${myVars.username}.packages = with pkgs; [
    protonvpn-cli_2
    protonvpn-gui
    gnome-tweaks
    gnome-keyring
    libsecret
    dbus
    python311Packages.protonvpn-nm-lib
  ];
}
