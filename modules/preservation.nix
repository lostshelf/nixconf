{ self, inputs, ... }: {
  flake.nixosModules.pcPreservationConfig = { ... }: {
    imports = [ inputs.preservation.nixosModules.preservation ];

    preservation = {
      enable = true;

      preserveAt."/persistent" = {
        directories = [
          "/var/log"
          "/var/lib/nixos"
          "/var/lib/AccountsService/icons"
          "/var/lib/AccountsService/users"
          "/var/lib/systemd/coredump"
          "/var/lib/systemd/timers"
          "/var/lib/flatpak"
          "/etc/NetworkManager/system-connections"
          "/etc/ssh"
          {
            directory = "/var/lib/colord";
            user = "colord";
            group = "colord";
            mode = "u=rwx,g=rx,o=";
          }
          "/etc/nixos"
          "/var/lib/bluetooth"
          "/etc/NetworkManager/system-connections"
          { directory = "/var/lib/nixos"; inInitrd = true; }
        ];

        files = [
          { file = "/etc/machine-id"; inInitrd = true; }
        ];

        users.hadif = {
          directories = [
            ".bash_history"
            ".ssh"
            ".gnupg"
            ".pki"

            ".mozilla"
            ".config/mozilla"

            ".config/fish"

            "Documents"
            "Downloads"
            "Music"
            "Videos"
            "Projects"
            "Homework"
            "Pictures"

            "nixos"

            ".var/app"
            ".local/share/flatpak"
          ];

          files = [

          ];
        };
      };
    };
  };
}
