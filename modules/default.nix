{...}: {
  imports = [
    ./cli
    ./core
    ./hardware
    ./video

    # TODO: remove this import when major refactoring is done
    ./nixos
  ];
}
