{
  config,
  lib,
  myLib,
  pkgs,
  ...
}: {
  home.activation.installNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${myLib.relativeToRoot "./dotfiles/nvim"}/ ${config.xdg.configHome}/nvim/
  '';

  programs = {
    neovim = {
      enable = true;

      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
