{username, pkgs, ...}: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    pointerCursor = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze;
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };

    sessionVariables = {
      XCURSOR_THEME = "Breeze";
    };

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
