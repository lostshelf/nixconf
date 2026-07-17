{ self, inputs, ... }: {
  flake.homeModules.gitConfig = { pkgs, ... }: {
    programs.fish.enable = true;

    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
