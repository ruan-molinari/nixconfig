{pkgs, ...}: {
  # Linux only packages go here
  home.packages = with pkgs; [
    libnotify
    ventory # create bootable usb
  ];
}
