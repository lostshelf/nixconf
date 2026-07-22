{ self, inputs, ... }: {
  flake.homeModules.miscConfig = { pkgs, ... }: {
    services.mpris-proxy.enable = true;
  };
}
