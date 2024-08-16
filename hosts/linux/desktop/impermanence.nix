{
  #impermanence,
  pkgs,
  ...
}: {
#  imports = [
#    impermanence.nixosModules.impermanence
#  ];
#
#  environment.systemPackages = [
#    pkgs.ncdu
#  ];
#
#  environment.persistence."/persistent" = {
#    users.ruan = {
#      directories = [
#        "workspace"
#        "open-source"
#        "programs"
#        "nixconfig"
#        "tmp"
#        "bin"
#
#        "Downloads"
#        "Music"
#        "Pictures"
#        "Documents"
#        "Videos"
#        "Calibre Library"
#
#        {
#          directory = ".gnupg";
#          mode = "0700";
#        }
#        {
#          directory = ".ssh";
#          mode = "0700";
#        }
#        {
#          directory = ".docker";
#          mode = "0700";
#        }
#
#        # misc
#        ".config/pulse"
#        ".steam"
#
#        # browsers
#        ".mozilla"
#
#        ".local/share"
#        ".local/state"
#
#        # language package manager
#        ".bun"
#        ".npm"
#        "go"
#        ".conda"
#        ".rustup"
#        ".cargo"
#        "Odin"
#        "zig"
#
#        ".wakatime"
#      ];
#
#      files = [
#        ".wakatime.cfg"
#        ".config/nushell/history.txt"
#      ];
#    };
#  };
}
