{ libs, pkgs, ... }: {
  home.packages = with pkgs; [
    prismlauncher
    umu-launcher
    lutris
    protonup-qt
    gamescope
    r2modman
  ];
}
