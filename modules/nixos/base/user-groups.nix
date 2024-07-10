{
  myVars,
  config,
  ...
}: {
  # Don't allow mutation of users outside the config.
  users.mutableUsers = true;

  users.groups = {
    "${myVars.username}" = {};
    docker = {};
    wireshark = {};
  };

  users.users.${myVars.username} = {

    home = "/home/${myVars.username}";
    isNormalUser = true;
    extraGroups = [
      myVars.username
      "users"
      "networkmanager"
      "wheel"
      "docker"
      "wireshark"
      "libvirtd"
    ];
  };
}
