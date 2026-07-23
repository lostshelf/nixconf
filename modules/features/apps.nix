{ self, inputs, ... }: {
  flake.nixosModules.apps = { pkgs, ... }: {
    imports = [ inputs.preservation.nixosModules.preservation ];

    environment.systemPackages = with pkgs; [
      discord-canary
      vesktop

      proton-pass
      proton-vpn

      ungoogled-chromium

      blender
      gimp
      krita
      tenacity
      aseprite

      freecad
      logisim-evolution
      kicad

      anki

      celestia

      texliveMedium
      texstudio

      libreoffice-qt-fresh
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
    ];

    preservation.preserveAt."/persistent".users.hadif = {
      directories = [
        ".config/vesktop"
        ".config/discordcanary"
        ".config/discord"

        ".config/Proton/VPN/"
        ".config/Proton Pass/Local Storage"
        ".config/Proton Pass/IndexedDB"
        ".config/Proton Pass/Session Storage"

        ".config/chromium"
      ];
    };
  };
}
