{ self, inputs, ... }: {
  flake.homeModules.miscConfig = { pkgs, ... }: {
    services.mpris-proxy.enable = true;

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "com.brave.Browser.desktop";
        "x-scheme-handler/http" = "com.brave.Browser.desktop";
        "x-scheme-handler/https" = "com.brave.Browser.desktop";
        "x-scheme-handler/about" = "com.brave.Browser.desktop";
        "x-scheme-handler/unknown" = "com.brave.Browser.desktop";
      };
    };
  };
}
