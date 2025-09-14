{ libs, pkgs, ... }: {
  home.packages = with pkgs; [
    obsidian
    libreoffice-fresh
    wpsoffice
    onlyoffice-desktopeditors
    dnote
  ];
}
