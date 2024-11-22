{ pkgs, inputs, ... }: {
  xdg.portal = {
    enable = true;

    config = {
      common = {
        default = "*";
        # except for the secret portal, which is handled by gnome-keyring
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
    };

    # Sets environment variable NIXOS_XDG_OPEN_USE_PORTAL to 1
    # This will make xdg-open use the portal to open programs,
    # which resolves bugs involving programs opening inside FHS envs or with unexpected env vars set from wrappers.
    # xdg-open is used by almost all programs to open a unknown file/uri
    # alacritty as an example, it use xdg-open as default, but you can also custom this behavior
    xdgOpenUsePortal = false;
    extraPortals = [
      # xdg-desktop-portal-gtk # for gtk
      inputs.xdg-luminous
    ];
  };

  environment.systemPackages = [
    pkgs.wayshot
    pkgs.wf-recorder

    inputs.swww.packages.${pkgs.system}.swww
  ];
}
