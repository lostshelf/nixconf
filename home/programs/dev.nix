{ lib, pkgs, unstable, ... }: {
  home.packages = let
    jetbrain_ides = with unstable.jetbrains; [
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
    dev_pkgs = with unstable; [
      nmap
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
      # android-studio-full
      # android-studio-tools
    ];
    dev = with pkgs; [
      # virtualbox
    ];
  in
    dev_pkgs ++ jetbrain_ides ++ dev;

  programs = {
    tmux = {
      enable = true;
    };

    vscode = {
      enable = true;
    };
  };

  home.sessionVariables = {
    NIXPKGS_ACCEPT_ANDROID_SDK_LICENSE = "1";
  };
}
