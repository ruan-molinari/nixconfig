{ pkgs
, inputs
, config
, ...
}: {
  environment.systemPackages = [
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
