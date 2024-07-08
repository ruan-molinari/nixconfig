{
  config,
  myvars,
  ...
}: {
  home.homeDirectory = "/home/${myvars.username}";

  # default environment variables go here
  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
