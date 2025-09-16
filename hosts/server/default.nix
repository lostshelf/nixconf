{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common.nix
  ];

  networking.hostName = "server";

  services = {
    cockpit = {
      enable = true;
      openFirewall = true;
    };

    jellyfin = {
      enable = true;
      openFirewall = true;

    };

    httpd = {
      enable = true;
      adminAddr = "hadifaraz52@protonmail.com";
      virtualHosts = {
        "cockpit.server.bepistypebeat.com" = {
          forceSSL = true;
          sslServerCert = "/var/lib/acme/cockpit.server.bepistypebeat.com/fullchain.pem";
          sslServerKey = "/var/lib/acme/cockpit.server.bepistypebeat.com/key.pem";
          extraConfig = ''
            SSLProxyEngine On
            ProxyRequests Off

            ProxyPass / https://127.0.0.1:9090/
            ProxyPassReverse / https://127.0.0.1:9090/


            ProxyPass "/socket" "wss://127.0.0.1:9090/socket"
            ProxyPassReverse "/socket" "wss://127.0.0.1:9090/socket"
            RequestHeader set Origin "https://cockpit.server.bepistypebeat.com"
          '';
        };
      };
      extraModules = [
        "proxy"
        "proxy_http"
        "proxy_wstunnel"
        "ssl"
      ];
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "hadifaraz52@protonmail.com";
    certs = {
      "cockpit.server.bepistypebeat.com" = {
        dnsProvider = "cloudflare";
        credentialsFile = "/etc/nixos/secrets/cloudflare-creds";
      };
    };
  };

  systemd = {
    extraConfig = ''
      [Login]
      HandleLidSwitch=ignore
      HandleLidSwitchDocked=ignore
      HandleLidSwitchExternalPower=ignore
    '';
  };

  programs = {
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };

  environment.systemPackages = with pkgs; [
    cockpit
    apacheHttpd
  ];
}
