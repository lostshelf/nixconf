{ pkgs, ... }: {
  imports = [
    ./browsers.nix # Any browsers I want and their config
    ./git.nix # Git related packages
    ./media.nix # All media related packages
    ./xdg.nix # XDG Portal setup
    ./re.nix # All Reverse Engineering related programs (rizin, cutter, frida, etc.)
    ./dev.nix # All programming related programs (vscode, distrobox, devcontainer, toolbox)
    ./office.nix # All file editing programs (libreoffice, wpsoffice, obsidian)
    ./im.nix # All instant messaging programs (discord, telegram)
    ./design.nix # All media creation related programs (blender, CAD tools, etc.)
    ./gaming.nix # Gaming related programs
  ];
}
