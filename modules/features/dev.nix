{ self, inputs, ... }: {
  flake.nixosModules.devConfig = { pkgs, lib, config, ... }: {
    nixpkgs.config.android_sdk.accept_license = true;
  };
}
