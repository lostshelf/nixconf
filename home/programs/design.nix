{ libs, pkgs, ... }: {
  home.packages = with pkgs; [
    freecad-wayland
    librecad
    blender
    gimp
    godot
    graphviz
    insomnia
    libnotify
    wineWowPackages.wayland
  ];
}
