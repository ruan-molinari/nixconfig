{
  pkgs,
  lib,
  ...
}:{

  programs.zed-editor ={
    enable = true;
    extensions = ["nix" "toml" "zig" "json" "make"];

    userSettings = {
      assistant = {
        enabled = true;
        version = "2";

        default_model = {
          provider = "openai";
          model = "gpt-4o-mini";
        };
      };

      vim_mode = true;

      terminal = {
        env = {
          TERM = "alacritty";
        };
      };

      lsp = {
        nix = {
          binary = {
            path_lookup = true;
          };
        };

        zls = {
          binary = {
            path_lookup = true;
          };
        };
      };

      theme = {
        dark = "Rosé Pine";
        light = "Rosé Pine Dawn";
        mode = "system";
      };
    };
  };
}
