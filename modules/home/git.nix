{ self, inputs, ... }: {
  flake.homeModules.gitConfig = { pkgs, ... }: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Hadi Faraz";
          email = "hadifaraz52@protonmail.com";
          init.defaultBranch = "master";
        };
      };
    };
  };
}
