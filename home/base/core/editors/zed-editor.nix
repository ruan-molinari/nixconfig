{
  pkgs,
  pkgs-unstable
, config
, lib
, myLib
, ...
}:{

  home.activation.installZedEditor = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${myLib.relativeToRoot "./dotfiles/zed"}/ ${config.xdg.configHome}/zed/
  '';

  home.packages = with pkgs-unstable; [
    zed-editor
  ];
}
