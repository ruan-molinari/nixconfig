{
  config,
  lib,
  pkgs,
  myVars,
  ...
}: {
  programs.git = {
    enable = true;
    userName = myVars.username;
    userEmail = myVars.email;

    lfs.enable = true;

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;

      url = {
        "ssh://git@github.com/ruan-molinari" = {
          insteadOf = "https://github.com/ruan-molinari";
        };
      };
    };

    aliases = {
      unstage = "reset HEAD --"; # unstage file via `git unstage <file>`
      update = "submodules update --init --recursive";
    };
  };
}
