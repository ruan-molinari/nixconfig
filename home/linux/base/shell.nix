{
  config,
  myVars,
  ...
}: {
  home.homeDirectory = "/home/${myVars.username}";

  # default environment variables go here
  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
