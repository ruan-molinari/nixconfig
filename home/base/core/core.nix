{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Misc
    tldr
    gnupg
    gnumake

    # Morden cli tools, replacement of grep/sed/...

    # Interactively filter its input using fuzzy searching, not limit to filenames.
    fzf
    # search for files by name, faster than find
    fd
    # search for files by its content, replacement of grep
    (ripgrep.override {withPCRE2 = true;})

    bat

    just # like make but simpler
  ];

  programs = {
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
