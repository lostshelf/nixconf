{config, ...}: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./fish.nix
  ];

  home.sessionVariables = {
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    WINEPREFIX = d + "/wine";
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "konsole";
  };
}
