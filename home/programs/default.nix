{ pkgs, ... }: {
  imports = [
    ./browsers.nix # Any browsers I want and their config
    ./cli.nix
    ./design.nix # All media creation related programs (blender, CAD tools, etc.)
    ./dev.nix # All programming related programs (vscode, distrobox, devcontainer, toolbox)
    ./gaming.nix # Gaming related programs
    ./git.nix # Git related packages
    ./im.nix # All instant messaging programs (discord, telegram)
    ./media.nix # All media related packages
    ./office.nix # All file editing programs (libreoffice, wpsoffice, obsidian)
    ./re.nix # All Reverse Engineering related programs (rizin, cutter, frida, etc.)
    ./xdg.nix # XDG Portal setup
  ];
}
