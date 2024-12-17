{
  pkgs,
  lib,
  ...
}:{

  programs.zed-editor ={
    enable = true;
    extensions = ["nix" "toml" "zig" "json"];


    userSettings = {

      assistant = {
        enabled = true;
        version = "2";

        default_model = {
          provider = "copilot_chat";
          model = "gpt-4o";
        };
      };

      vim_mode = true;
      theme = {
        dark = "Rosé Pine";
        light = "Rosé Pine Dawn";
        mode = "system";
      };
    };
  };
}
