{ self, inputs, ... }: {
  flake.nixosModules.apps = { pkgs, ... }: {
    imports = [
      inputs.preservation.nixosModules.preservation
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    environment.systemPackages = with pkgs; [
      discord-canary
      vesktop

      proton-pass
      proton-vpn

      ungoogled-chromium

      blender
      gimp
      krita
      
      pixelorama

      texliveFull
      texstudio

      libreoffice-qt
      wpsoffice
      onlyoffice-desktopeditors

      hunspell
      hunspellDicts.en_CA
      hunspellDicts.de_DE

      tidal-hifi
      easyeffects

      waydroid
      waydroid-helper

      whatsie

      varia

      qbittorrent-enhanced

      virt-manager
      quickemu

      openrgb

      brave
    ];

    services.flatpak.packages = [
      "org.vinegarhq.Sober"
      "com.vysp3r.ProtonPlus"
    ];

    virtualisation.waydroid.enable = true;

    preservation.preserveAt."/persistent".users.hadif = {
      directories = [
        ".config/vesktop/settings"
        ".config/vesktop/themes"
        ".config/vesktop/sessionData/Local Storage"
        ".config/vesktop/sessionData/IndexedDB"
        ".config/vesktop/sessionData/vencordFiles"

        ".config/discordcanary/IndexedDB"
        ".config/discordcanary/Local Storage"

        ".config/discord/IndexedDB"
        ".config/discord/Local Storage"

        ".config/Proton/VPN/"
        ".config/Proton Pass/Local Storage"
        ".config/Proton Pass/IndexedDB"
        ".config/Proton Pass/Session Storage"

        ".config/chromium/Default/Local Storage"
        ".config/chromium/Default/IndexedDB"
        ".config/chromium/Default/Sync Data"
        ".config/chromium/Default/Web Applications"
        ".config/chromium/Default/Extension State"

        ".var/app/org.vinegarhq.Sober/config"
        ".var/app/org.vinegarhq.Sober/data"
        ".var/app/com.vysp3r.ProtonPlus/config"
        ".var/app/com.vysp3r.ProtonPlus/data"

        ".local/BraveSoftware"

        ".config/Proton"
        ".config/Proton Pass"
      ];

      files = [
        ".config/vesktop/settings.json"
        ".config/vesktop/state.json"
        ".config/vesktop/sessionData/Cookies"
        ".config/vesktop/sessionData/Preferences"

        ".config/discordcanary/settings.json"
        ".config/discordcanary/Cookies"
        ".config/discordcanary/Cookies-journal"
        ".config/discordcanary/Preferences"

        ".config/chromium/Local State"
        ".config/chromium/Default/Preferences"
        ".config/chromium/Default/Secure Preferences"
        ".config/chromium/Default/Bookmarks"
        ".config/chromium/Default/Cookies"
        ".config/chromium/Default/History"
        ".config/chromium/Default/Favicons"
        ".config/chromium/Default/Login Data"
        ".config/chromium/Default/Login Data For Account"
        ".config/chromium/Default/Web Data"
        ".config/chromium/Default/Account Web Data"
        ".config/chromium/Default/Top Sites"
        ".config/chromium/Default/Shortcuts"
      ];
    };
  };
}
