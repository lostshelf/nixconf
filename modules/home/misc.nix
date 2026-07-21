{ self, inputs, ... }: {
  flake.homeModules.gitConfig = { pkgs, ... }: {
    services.mpris-proxy.enable = true;
  };
}
