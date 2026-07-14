{ self, inputs, ... }: {
  flake.homeModules.gitConfig = { pkgs, ... }: {
    programs.git = {
      enable = true;
      config.user = {
        name = "Hadi Faraz";
        email = "hadifaraz52@protonmail.com";
      };
    };
  };
}
