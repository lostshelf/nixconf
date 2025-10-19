{ libs, pkgs, unstable, ... }: {
  home.packages = with unstable; [
    obsidian
    libreoffice-fresh
    wpsoffice
    onlyoffice-desktopeditors
    dnote
  ];
}
