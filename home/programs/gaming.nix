{ libs, pkgs, unstable, ... }: {
    home.packages = let
      npkgs = with pkgs; [
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
      npkgs ++ upkgs;

}
