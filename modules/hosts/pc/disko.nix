{ self, inputs, ... }: {
  flake.nixosModules.pcDiskoConfig = { pkgs, lib, config,  ... }: {
    imports = [ inputs.disko.nixosModules.disko ];

    fileSystems."/nix".neededForBoot = true;
    fileSystems."/persistent".neededForBoot = true;

    disko.devices.nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "size=25%"
          "mode=755"
        ];
      };
    };

    disko.devices.disk.main = {
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
        size = "2G";
        type = "EF00";

        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
        };
      };

      content.partitions.swap = {
        size = "64G";

        content = {
          type = "swap";
          resumeDevice = true;
        };
      };

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

      systemd.tmpfiles.rules = [
        "d /mnt/Storage1 0755 hadif users - -"
        "d /mnt/Storage2 0755 hadif users - -"
      ];
  };
}
