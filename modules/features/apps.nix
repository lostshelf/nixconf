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

    services.flatpak.packages = [
      "org.vinegarhq.Sober"
      "com.vysp3r.ProtonPlus"
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
