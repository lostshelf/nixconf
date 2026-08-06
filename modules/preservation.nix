{ self, inputs, ... }: {
  flake.nixosModules.pcPreservationConfig = { ... }: {
    imports = [ inputs.preservation.nixosModules.preservation ];

    preservation = {
      enable = true;

      preserveAt."/persistent" = {
        directories = [
          { directory = "/var/lib/sbctl"; inInitrd = true; }
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
          { directory = "/var/lib/nixos"; inInitrd = true; }
        ];

        files = [
          { file = "/etc/machine-id"; inInitrd = true; }
        ];

        users.hadif = {
          directories = [
            ".ssh"
            ".gnupg"
            ".pki"

            ".config/fish"
            ".local/share/fish"
            ".local/share/zoxide"

            "Documents"
            "Downloads"
            "Music"
            "Videos"
            "Projects"
            "Homework"
            "Pictures"

            ".local/share/flatpak"

            ".config/mozilla/firefox/mkdvt6af.default/extensions"
            ".config/mozilla/firefox/mkdvt6af.default/storage"
            ".config/mozilla/firefox/mkdvt6af.default/sessionstore-backups"
            ".config/mozilla/firefox/mkdvt6af.default/weave"
            ".config/mozilla/firefox/Profile Groups"

            ".config/VSCodium/User/snippets"
            ".config/VSCodium/User/globalStorage"
            ".config/VSCodium/User/workspaceStorage"
            ".config/VSCodium/User/History"
            ".config/VSCodium/Backups"
          ];

          files = [
            ".config/nix/nix.conf"

            ".local/share/fish/fish_history"
            ".local/share/fish/fish_variables"

            ".config/mozilla/firefox/profiles.ini"
            ".config/mozilla/firefox/installs.ini"
            ".config/mozilla/firefox/mkdvt6af.default/places.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/places.sqlite-wal"
            ".config/mozilla/firefox/mkdvt6af.default/places.sqlite-shm"
            ".config/mozilla/firefox/mkdvt6af.default/favicons.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/favicons.sqlite-wal"
            ".config/mozilla/firefox/mkdvt6af.default/favicons.sqlite-shm"
            ".config/mozilla/firefox/mkdvt6af.default/cookies.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/cookies.sqlite-wal"
            ".config/mozilla/firefox/mkdvt6af.default/formhistory.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/logins.json"
            ".config/mozilla/firefox/mkdvt6af.default/logins-backup.json"
            ".config/mozilla/firefox/mkdvt6af.default/logins.db"
            ".config/mozilla/firefox/mkdvt6af.default/key4.db"
            ".config/mozilla/firefox/mkdvt6af.default/cert9.db"
            ".config/mozilla/firefox/mkdvt6af.default/pkcs11.txt"
            ".config/mozilla/firefox/mkdvt6af.default/permissions.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/content-prefs.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/handlers.json"
            ".config/mozilla/firefox/mkdvt6af.default/search.json.mozlz4"
            ".config/mozilla/firefox/mkdvt6af.default/extensions.json"
            ".config/mozilla/firefox/mkdvt6af.default/extension-preferences.json"
            ".config/mozilla/firefox/mkdvt6af.default/extension-settings.json"
            ".config/mozilla/firefox/mkdvt6af.default/addons.json"
            ".config/mozilla/firefox/mkdvt6af.default/addonStartup.json.lz4"
            ".config/mozilla/firefox/mkdvt6af.default/containers.json"
            ".config/mozilla/firefox/mkdvt6af.default/xulstore.json"
            ".config/mozilla/firefox/mkdvt6af.default/sessionstore.jsonlz4"
            ".config/mozilla/firefox/mkdvt6af.default/sessionCheckpoints.json"
            ".config/mozilla/firefox/mkdvt6af.default/signedInUser.json"
            ".config/mozilla/firefox/mkdvt6af.default/synced-tabs.db"
            ".config/mozilla/firefox/mkdvt6af.default/synced-tabs.db-wal"
            ".config/mozilla/firefox/mkdvt6af.default/synced-tabs.db-shm"
            ".config/mozilla/firefox/mkdvt6af.default/storage-sync-v2.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/storage-sync-v2.sqlite-wal"
            ".config/mozilla/firefox/mkdvt6af.default/storage-sync-v2.sqlite-shm"
            ".config/mozilla/firefox/mkdvt6af.default/storage.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/webappsstore.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/webappsstore.sqlite-wal"
            ".config/mozilla/firefox/mkdvt6af.default/protections.sqlite"
            ".config/mozilla/firefox/mkdvt6af.default/compatibility.ini"
            ".config/mozilla/firefox/mkdvt6af.default/times.json"
            ".config/mozilla/firefox/mkdvt6af.default/prefs.js"
          ];
        };
      };
    };
  };
}
