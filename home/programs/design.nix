{ libs, pkgs, ... }: {
  home.packages = with pkgs; [
    freecad-wayland
    librecad
    blender
    gimp
    godot
  ];
}
