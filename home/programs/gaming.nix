{ libs, pkgs, unstable, ... }: {
  home.packages = let
    pkgs = with pkgs; [
      prismlauncher
    ];
    upkgs = with unstable; [
      umu-launcher
      lutris
      protonup-qt
      gamescope
      r2modman
    ];
  in
    pkgs ++ upkgs;
}
