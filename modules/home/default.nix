{ self, inputs, config,  ... }: {
  imports = [ inputs.home-manager.flakeModules.home-manager ];

  flake.nixosModules.homeConfig = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs self; };
      backupFileExtension = "hm-bak";
      sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
      users.hadif.imports = with self.homeModules; [
        { home.stateVersion = "26.05"; }
        plasmaConfig
        gitConfig
        vscConfig
      ];
    };
  };
}
