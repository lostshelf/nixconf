{ self, inputs, ... }: {
  flake.nixosModules.devConfig = { pkgs, lib, config, ... }: {
    environment.systemPackages = with pkgs; [
      nil

      godot

      devenv
    ];

    nixpkgs.config.android_sdk.accept_license = true;
  };
}
