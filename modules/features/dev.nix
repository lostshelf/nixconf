{ self, inputs, ... }: {
  flake.nixosModules.devConfig = { pkgs, lib, config, ... }: {
    environment.systemPackages = with pkgs; [
      nil

      godot

      devenv

      distrobox

      devcontainer

      vscodium-fhs
    ];

    nixpkgs.config.android_sdk.accept_license = true;

    programs.devenv = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
