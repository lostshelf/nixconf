{ lib, pkgs, ... }:
let
  jetbrain_ides = with pkgs.jetbrains; [
    clion
    goland
    idea-ultimate
    rust-rover
    webstorm
    phpstorm
    writerside
    rider
    ruby-mine
    pycharm-professional
    mps
    gateway
    dataspell
    datagrip
    aqua
  ];
in {
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
    (lib.lowPrio clang)
    toybox
    gnumake
    cmake
    ninja
    gnum4
    android-studio-full
    android-studio-tools
  ] ++ jetbrain_ides;

  programs = {
    tmux = {
      enable = true;
    };

    vscode = {
      enable = true;
    };
  };

}
