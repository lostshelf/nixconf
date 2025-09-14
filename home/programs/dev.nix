{ lib, pkgs, ... }: {
  home.packages = with pkgs; [
    docker
    kubectl
    distrobox
    podman
    devcontainer
    jetbrains-toolbox
    python3 # Needed for IDA
    qemu
    rustup
    ghc
    cabal-install
    nim
    clisp
    nasm
    go
    (lib.hiPrio gcc)
    (lib.lowPrio binutils)
    toybox
    gnumake
    cmake
    ninja
  ];

  programs = {
    tmux = {
      enable = true;
    };

    vscode = {
      enable = true;
    };
  };

}
