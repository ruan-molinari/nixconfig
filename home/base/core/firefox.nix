{ config
, lib
, pkgs
, inputs
, ...
}:
{

  programs.firefox = {
    enable = true;
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };
}
