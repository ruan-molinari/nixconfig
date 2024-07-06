{pkgs, ...}: {

  home.packages = with pkgs; [
    #-- c/c++
    # those are usually needed even when not developing anything with C/C++
    cmake
    cmake-language-server
    gnumake
    checkmake
    # c/c++ compiler, required by nvim-treesitter!
    gcc
    # c/c++ tools with clang-tools, the unwrapped version won't
    # add alias like `cc` and `c++`, so that it won't conflict with gcc
    # llvmPackages.clang-unwrapped
    clang-tools
    lldb

    #-- python
    (python311.withPackages (
      ps:
        with ps; [
          ruff-lsp
          black # python formatter
          # debugpy

          # my commonly used python packages
          jupyter
          ipython
          pandas
          requests
          pyquery
          pyyaml
          boto3

          ## emacs's lsp-bridge dependenciesge
          # epc
          # orjson
          # sexpdata
          # six
          # setuptools
          # paramiko
          # rapidfuzz
        ]
    ))
    
    #-- rust
    #rust-analyzer
    # TODO: use rustup to install rust stuff
    cargo # rust package manager
    #rustfmt

    #-- nix
    statix # Lints and suggestions for the nix programming language
    deadnix # Find and remove unused code in .nix source files
    alejandra # Nix Code Formatter

    bun

    # Misc
    tree-sitter
    fzf

    # Dependencies
    gdu
    (ripgrep.override {withPCRE2 = true;})
    
  ];
}
