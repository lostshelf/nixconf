{ libs, pkgs, unstable, ... }: {
    home.packages = let
      npkgs = with pkgs; [
        prismlauncher
        lunar-client
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
