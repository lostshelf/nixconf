{ config, pkgs, unstable, ... }: {
  home.packages = with unstable; [
    zip
    unzip
    p7zip
    ripgrep
    htop
    hollywood
    fastfetch
    figlet
    rclone
    fzf
    cmatrix
    hping
  ];
}
