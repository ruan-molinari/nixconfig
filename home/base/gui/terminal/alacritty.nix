{ pkgs
, config
, lib
, myLib
, ...
}: {

  home.activation.installAlacritty = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${myLib.relativeToRoot "./dotfiles/alacritty"}/ ${config.xdg.configHome}/alacritty/
  '';

  programs.alacritty = {
    enable = true;
  };
}
