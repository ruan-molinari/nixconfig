{
  config,
  lib,
  pkgs,
}:

{
  environment.systemPackages = [
    (pkgs.firefox.overrideAttrs (old: {
      buildCommand =
        old.buildCommand
        + ''
          substituteInPlace $out/bin/firefox --replace "exec -a" "MOZ_ENABLE_WAYLAND=0 exec -a"
        '';
    }))
  ];
}
