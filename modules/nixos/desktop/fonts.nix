{pkgs, ...}: {

  fonts = {
    # user defined fonts
    enableDefaultPackages = true; # make it false to use custom fonts
    # fontconfig.defaultFonts = {
    #   serif = ["Source Han Serif SC" "Source Han Serif TC" "Noto Color Emoji"];
    #   sansSerif = ["Source Han Sans SC" "Source Han Sans TC" "Noto Color Emoji"];
    #   monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
    #   emoji = ["Noto Color Emoji"];
    # };

    fontDir.enable = true;

    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];
  };
}
