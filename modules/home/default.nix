{ self, inputs, ... }: {
  flake.nixosModules.homeConfig = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs self; };
      users.hadif = {
        imports = [ self.homeModules.plasmaConfig ];

        home.stateVersion = "26.05";
      };
    };
  };
}
