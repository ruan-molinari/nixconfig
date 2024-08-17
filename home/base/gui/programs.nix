{ 
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    vesktop
  ];

  home.sessionVariables = {
    #XDG_DESKTOP_PORTAL_DIR = "";
  };
}
