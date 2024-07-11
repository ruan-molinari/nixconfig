{pkgs, ...}: 
let
  inherit (pkgs) nu_scripts;
in {
  programs.nushell = {
    extraConfig = ''
      # completion
      use ${nu_scripts}/share/nu_scripts/custom-completions/git/git-completions.nu *
      use ${nu_scripts}/share/nu_scripts/custom-completions/glow/glow-completions.nu *
      use ${nu_scripts}/share/nu_scripts/custom-completions/just/just-completions.nu *
      use ${nu_scripts}/share/nu_scripts/custom-completions/make/make-completions.nu *
      use ${nu_scripts}/share/nu_scripts/custom-completions/man/man-completions.nu *
      use ${nu_scripts}/share/nu_scripts/custom-completions/nix/nix-completions.nu *
      use ${nu_scripts}/share/nu_scripts/custom-completions/cargo/cargo-completions.nu *
      # alias
      #use ${nu_scripts}/share/nu_scripts/aliases/git/git-aliases.nu *
      use ${nu_scripts}/share/nu_scripts/aliases/bat/bat-aliases.nu *
    '';
  };
}
