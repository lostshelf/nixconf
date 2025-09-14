{ pkgs, lib, username, config, ...}: {
    console.earlySetup = false;

    # Bootloader.
    boot = {
      loader = {
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
        systemd-boot = {
          enable = true;
          configurationLimit = 5;
          consoleMode = "max";
        };
        timeout = 0;
      };
      plymouth = {
        enable = true;
      };
      initrd.systemd.enable = true;
      consoleLogLevel = 0;
      kernelParams = [ "quiet" "splash" "loglevel=0" "systemd.show_status=false" "rd.systemd.show_status=false" "udev.log_priority=0" "amd_pstate=active" ];
      kernelPackages = pkgs.linuxPackages_latest;
    };

    hardware = {
      enableAllFirmware = true;
      firmware = with pkgs; [ linux-firmware ];
    };

    users = {
      users = {
        ${username} = {
          isNormalUser = true;
          description = "Hadi Faraz";
          extraGroups = ["networkmanager" "wheel" "dialout" "docker"];
        };

        danif = {
          isNormalUser = true;
          description = "Daniyal Faraz";
          hashedPassword = "$6$xJTUGzkqNfZKjW7O$csMz3bFAgNs7nvTzVWF/vyvvz9RdtSiNzTAgIx18ZR5V1XnFQtW/j2y6ekj.YF3niqwNis.IgS7HpBdVZCGu8.";
        };
      };
    };

    virtualisation = {
      docker.enable = true;
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
          ovmf = {
            enable = true;
            packages = with pkgs; [ OVMFFull.fd ];
          };
        };
      };
    };

    nix = {
      settings = {
        trusted-users = [username];
        experimental-features = ["nix-command" "flakes"];
      };

      gc = {
        automatic = lib.mkDefault true;
        dates = lib.mkDefault "weekly";
        options = lib.mkDefault "--delete-older-than 7d";
      };
    };

    nixpkgs.config.allowUnfree = true;

    time.timeZone = "America/Edmonton";
    i18n.defaultLocale = "en_CA.UTF-8";

    fonts = {
      packages = with pkgs; [
      	corefonts
        material-design-icons

        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji

        nerd-fonts.symbols-only # symbols icon only
        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono
        nerd-fonts.iosevka
      ];
    };

    networking = {
      networkmanager.enable = true;
      firewall.enable = true;
    };

    environment.systemPackages = with pkgs; [
      neovim
      wget
      curl
      git
      sysstat
      lm_sensors
      firefox
      fishPlugins.tide
      gnupg
      openssh
      pciutils
      usbutils
      xdg-utils
      flatpak
      dmidecode
      killall
    ];

    environment.variables.EDITOR = "nvim";

    security.rtkit.enable = true;

    services = {
      printing.enable = true;
      flatpak.enable = true;
      power-profiles-daemon.enable = true;
      upower.enable = true;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      pulseaudio.enable = false;
      fwupd.enable = true;
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
      samba.enable = true;
    };

    programs = {
      fish = {
        enable = true;
      };
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
        protontricks.enable = true;
      };
      kdeconnect = {
        enable = true;
      };
      ssh = {
        startAgent = true;
      };
      nix-ld.enable = true;
      command-not-found.enable = false;
    };

    system.autoUpgrade = {
      enable = true;
      # flake = inputs.self.outPath;
      flags = [
        "--update-input"
        "nixpkgs"
        # "-L" # Prints build logs
      ];
      dates = "08:00";
      randomizedDelaySec = "45min";
    };
}
