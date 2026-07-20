{ self, inputs, ... }: {
  flake.nixosModules.kdeConfig = { pkgs, lib, config, ... }: {
    services.desktopManager.plasma6.enable = true;
    services.displayManager.plasma-login-manager.enable = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs.kdePackages; [ xdg-desktop-portal-kde ];
    xdg.portal.config.common.default = "kde";
    xdg.mime = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
      };
    };

    environment.sessionVariables = {
      GTK_USE_PORTAL = "1";
      SSH_ASKPASS = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
      SSH_ASKPASS_REQUIRE = "prefer";
    };

    security.pam.services.kdewallet.enable = true;

    programs.kdeconnect.enable = true;

    services.dbus.enable = true;

    environment.systemPackages = let
      npkgs = with pkgs; [
        kdiff3
        hardinfo2
        wayland-utils
        wl-clipboard
        krename
        kile
        ffmpegthumbnailer
        kid3-kde
        qt6.qttools
        libappindicator
        libappindicator-gtk3
        unrar
        tesseract
        haruna
      ];

      kpkgs = with pkgs.kdePackages; [
        dolphin-plugins
        kdegraphics-thumbnailers
        kcharselect
        kio-fuse
        kolourpaint
        ksystemlog
        kate
        plymouth-kcm
        plasma-firewall
        kwallet-pam
        flatpak-kcm
        kde-gtk-config
        wacomtablet
        ark
        audiocd-kio
        kdenetwork-filesharing
        kio
        kio-extras
        kclock
        kio-admin
        kio-gdrive
        keditbookmarks
        kcalc
        kwallet-pam
        kinfocenter
        plasma-browser-integration
        colord-kde
        ksystemlog
        kcolorchooser
        partitionmanager
        plasma-thunderbolt
        plasma-disks
        kunitconversion
        ksshaskpass
        krunner
        kruler
        krfb
        krdc
        kpipewire
        kpat
        ksystemstats
        kquickcharts
        kompare
        qt6gtk2
        kdegraphics-mobipocket
        kmines
        kio-zeroconf
        kio-fuse
        kgpg
        kfind
        kdesdk-thumbnailers
        kdeconnect-kde
        kamera
        kalarm
        kactivitymanagerd
        kaccounts-integration
        isoimagewriter
        filelight
        elisa
        kdenlive
        plasma-vault
        plasma-activities
        plasma-activities-stats
        plasma-integration
        kactivitymanagerd
        kamera
      ];
    in
      npkgs ++ kpkgs;

    preservation.preserveAt."/persistent".users.hadif = {
      directories = [
        ".config/kate"
        ".config/kdeconnect"
        ".local/share/dolphin"
        ".local/share/flatpak"
        ".local/share/kactivitymanagerd"
        ".local/share/kate"
        ".local/share/konsole"
        ".local/share/kwalletd"
        ".local/state/wireplumber"
        ".config/autostart"
        ".local/share/RecentDocuments"
      ];

      files = [
        ".config/krunnerrc"
        ".config/kwinrulesrc"
        ".config/kwinoutputconfig.json"
        ".config/powermanagementprofilesrc"
        ".config/baloofileinformationrc"
        ".config/baloofilerc"
        ".config/bluedevilglobalrc"
        ".config/dolphinrc"
        ".config/kwalletrc"
        ".config/gwenviewrc"
        ".config/kactivitymanagerd-pluginsrc"
        ".config/kactivitymanagerd-statsrc"
        ".config/kactivitymanagerd-switcher"
        ".config/kactivitymanagerdrc"
        ".config/katemetainfos"
        ".config/katerc"
        ".config/kateschemarc"
        ".config/katevirc"
        ".config/konsolerc"
        ".config/partitionmanagerrc"
        ".config/powermanagementprofilesrc"
        ".config/konsolesshconfig"
     ];
    };
  };
}
