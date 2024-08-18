{ myLib, pkgs, ... }: {
  imports = [
    ./river
  ];

  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
  };
}
