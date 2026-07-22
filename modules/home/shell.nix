{ self, inputs, ... }: {
  flake.homeModules.shellConfig = { pkgs, ... }: {
    programs.fish.enable = true;

    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
