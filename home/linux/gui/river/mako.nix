{ pkgs
, ...
}: {
  config.services.mako = {
    enable = true;
  };
}
