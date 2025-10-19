{ libs, pkgs, unstable, ... }: {
  home.packages = with unstable; [
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
