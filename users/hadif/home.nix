{ pkgs, ... }: {
  imports = [
    ../../home/core.nix
    ../../home/programs
    ../../home/shell
  ];

  programs.git.settings.user = {
    name = "Hadi Faraz";
    email = "hadifaraz52@protonmail.com";
  };
}
