{pkgs, ...}: {
  # Linux only packages go here
  home.packages = with pkgs; [
    libnotify
    ventoy # create bootable usb
  ];
}
