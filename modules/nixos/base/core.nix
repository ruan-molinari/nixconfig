{lib, pkgs, ...}: {
  boot.loader.systemd-boot = {
    # we use Git for version control, so we don't need to keep too many generations.
    configurationLimit = lib.mkDefault 50; # TODO: reduce it when we are done
    # pick the highest resolution for systemd-boot's console.
    consoleMode = lib.mkDefault "max";
  };

  # for power management
  services = {
    power-profiles-daemon = {
      enable = true;
    };
    upower.enable = true;
  };
}
