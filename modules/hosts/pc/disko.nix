{ self, inputs, ... }: {
  flake.nixosModules.pcDiskoConfig = { pkgs, lib, config,  ... }: {
    imports = [ inputs.disko.nixosModules.disko ];

    fileSystems."/nix".neededForBoot = true;
    fileSystems."/persistent".neededForBoot = true;

    # filesystem for a temporary root
    disko.devices.nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          # Initially use 25% of RAM
          "size=25%"

          # Make it read-only
          "mode=755"
        ];
      };
    };

    # Drive setup
    disko.devices.disk.main = {
      # Refer to drives from `/dev/disk/by-id`
      device = "/dev/disk/by-id/nvme-WD_BLACK_SN850X_2000GB_24021W801007";
      type = "disk";

      content.type = "gpt";

      content.partitions.boot = {
        name = "boot";
        size = "1M";
        type = "EF02";
      };

      content.partitions.esp = {
        name = "ESP";
        # NixOS can require a lot of space, especially if you add a lot of modules to the initramfs
        size = "2G";
        type = "EF00";

        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
        };
      };

      # Swap partition optional. Only required for hibernation.
      content.partitions.swap = {
        size = "64G";

        content = {
          type = "swap";
          resumeDevice = true;
        };
      };

      # Partition to store persisted files
      content.partitions.root = {
        name = "root";
        size = "100%";

        content = {
          type = "btrfs";
          extraArgs = ["-f"];

          subvolumes = {
            "/persistent" = {
              mountOptions = ["subvol=persistent" "noatime"];
              mountpoint = "/persistent";
            };

            "/nix" = {
              mountOptions = ["subvol=nix" "noatime"];
              mountpoint = "/nix";
            };
          };
        };
      };
    };

    # Basic storage drives
    disko.devices.disk."Storage1" = {
      device = "/dev/disk/by-id/nvme-Samsung_SSD_990_PRO_with_Heatsink_4TB_S7DSNJ0Y502069A";
      type = "disk";

      content = {
        type = "gpt";
        partitions.primary = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];

            subvolumes = {
              "/storage1" = {
                mountOptions = [ "subvol=storage1" "noatime" "compress=zstd" ];
                mountpoint = "/mnt/Storage1";
              };
            };
          };
        };
      };
    };

    disko.devices.disk."Storage2" = {
      device = "/dev/disk/by-id/nvme-CT4000P3PSSD8_2402E88D36DE";
      type = "disk";

      content = {
        type = "gpt";
        partitions.primary = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];

            subvolumes = {
              "/storage2" = {
                mountOptions = [ "subvol=storage2" "noatime" "compress=zstd" ];
                mountpoint = "/mnt/Storage2";
              };
            };
          };
        };
      };
    };

      # Make storage drives owned by me
      systemd.tmpfiles.rules = [
        "d /mnt/Storage1 0755 hadif users - -"
        "d /mnt/Storage2 0755 hadif users - -"
      ];
  };
}
