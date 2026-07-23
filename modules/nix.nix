{ self, inputs, ... }: {
  flake.nixosModules.nixConfig = { lib, ... }: {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.trusted-users = [ "hadif" ];
    # Disabled Nix GC after switching to nh
#     nix.gc.automatic = lib.mkDefault true;
#     nix.gc.dates = lib.mkDefault "weekly";
#     nix.gc.options = lib.mkDefault "--delete-older-than 7d";

    nixpkgs.overlays = [
      inputs.nix-vscode-extensions.overlays.default
    ];
  };
}
