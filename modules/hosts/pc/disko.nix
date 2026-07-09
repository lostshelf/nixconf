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
      device = "/dev/nvme0n1";
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
      device = "/dev/nvme1n1";
      type = "disk";

      content = {
        type = "filesystem";
        format = "ext4";
        mountpoint = "/mnt/Storage1";
      };
    };

    disko.devices.disk."Storage2" = {
      device = "/dev/nvme2n1";
      type = "disk";

      content = {
        type = "filesystem";
        format = "ext4";
        mountpoint = "/mnt/Storage2";
      };
    };

    disko.devices.disk."Storage3" = {
      device = "/dev/nvme3n1";
      type = "disk";

      content = {
        type = "filesystem";
        format = "ext4";
        mountpoint = "/mnt/Storage3";
      };
    };

      systemd.tmpfiles.rules = [
        "d /mnt/Storage1 0755 hadif users - -"
        "d /mnt/Storage2 0755 hadif users - -"
        "d /mnt/Storage3 0755 hadif users - -"
      ];
  };
}
