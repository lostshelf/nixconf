{ libs, pkgs, unstable, ... }: {
  home.packages = with unstable; [
    telegram-desktop
    discord
    vesktop
    zoom-us
    vesktop
    hexchat
  ];
}
