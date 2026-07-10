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

      texliveMedium
      texstudio
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
