{ libs, pkgs, ... }: {
  home.packages = with pkgs; [
    telegram-desktop
    discord
    vesktop
    zoom-us
    vesktop
    hexchat
  ];
}
