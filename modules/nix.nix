{ self, inputs, ... }: {
  flake.nixosModules.nixConfig = { lib, ... }: {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.trusted-users = [ "hadif" ];
    nix.settings.auto-optimise-store = true;

    nixpkgs.overlays = [
      inputs.nix-vscode-extensions.overlays.default
    ];
  };
}
