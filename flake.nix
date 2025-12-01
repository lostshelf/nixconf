{
  description = "My NixOS Setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    copyparty.url = "github:9001/copyparty";

    fw-fanctrl = {
      url = "github:TamtamHero/fw-fanctrl/packaging/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Disable CachyOS kernel cuz it only works for Unstable setups
    # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs";
    # chaotic-unstable.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # Using latest release due to the unstable nixpkgs repo
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, fw-fanctrl, copyparty, home-manager, nixos-hardware, ... }@inputs: {
    nixosConfigurations = {
      "framework" = let
        username = "hadif";
        system = "x86_64-linux";
        unstable = import nixpkgs-unstable { inherit system; config = { allowUnfree = true; }; };
        specialArgs = { inherit username; inherit system; inherit unstable; inherit copyparty; };
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;

          modules = [
            ./hosts/framework

            nixos-hardware.nixosModules.framework-16-7040-amd

            fw-fanctrl.nixosModules.default

            ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      "pc" = let
        username = "hadif";
        system = "x86_64-linux";
        unstable = import nixpkgs-unstable { inherit system; config = { allowUnfree = true; }; };
        specialArgs = { inherit username; inherit system; inherit unstable; inherit copyparty; };
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;

          modules = [
            ./hosts/pc

            ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
              home-manager.backupFileExtension = "backup";
            }

            # chaoticUnstable.nixosModules.default
          ];
        };
        "server" = let
          username = "hadif";
          system = "x86_64-linux";
          specialArgs = { inherit username; inherit system; inherit copyparty; };
        in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
              ./hosts/server

              ./users/${username}/nixos.nix
            ];
          };
        };
  };
}
