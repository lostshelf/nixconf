{ libs, pkgs, unstable, ... }: {
  home.packages = with unstable; [
    prismlauncher
    umu-launcher
    lutris
    protonup-qt
    gamescope
    r2modman
  ];
}
