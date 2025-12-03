{ lib, config, pkgs, unstable, username, ... }: {
  console.earlySetup = false;

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
    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    consoleLogLevel = 3;
    kernelParams = [ "quiet" "splash" "loglevel=3" "boot.shell_on_fail" "udev.log_priority=3""systemd.show_status=auto" "rd.systemd.show_status=auto" "amd_pstate=active"];
    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };

  hardware = {
    enableAllFirmware = true;
    firmware = with pkgs; [ linux-firmware ];
    graphics.enable32Bit = true;
  };

  systemd = {
    timers.nix-gc-time = {
      description = "Daily Nix Garbage Collection";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "daily";
        AccuracySec = "15min";
      };
    };
    services = {
      NetworkManager-wait-online.enable = false;
      "serial-getty@ttyS0".enable = false;
      "serial-getty@ttyS1".enable = false;
      "serial-getty@ttyS2".enable = false;
      "serial-getty@ttyS3".enable = false;
      "serial-getty@ttyS4".enable = false;
      "serial-getty@ttyS5".enable = false;
      "serial-getty@ttyS6".enable = false;
      "serial-getty@ttyS7".enable = false;
      "serial-getty@ttyS8".enable = false;
      "serial-getty@ttyS9".enable = false;
    };
  };

  virtualisation = {
    docker.enable = true;
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  nix = {
    settings = {
      trusted-users = [ username ];
      experimental-features = ["nix-command" "flakes"];
    };

    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  time.timeZone = "America/Edmonton";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_CA.UTF-8";
      LC_IDENTIFICATION = "en_CA.UTF-8";
      LC_MEASUREMENT = "en_CA.UTF-8";
      LC_MONETARY = "en_CA.UTF-8";
      LC_NAME = "en_CA.UTF-8";
      LC_NUMERIC = "en_CA.UTF-8";
      LC_PAPER = "en_CA.UTF-8";
      LC_TELEPHONE = "en_CA.UTF-8";
      LC_TIME = "en_CA.UTF-8";
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "Hadi Faraz";
    extraGroups = ["networkmanager" "wheel" "dialout" "docker" "video" "render" "libvirtd" "input" "uinput" "vboxusers" "gamemode"];
  };

  fonts = {
    fontconfig.useEmbeddedBitmaps = true;
    packages = with pkgs; [
      material-design-icons

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

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

  environment = {
    systemPackages = with pkgs; [
      neovim
      wget
      curl
      git
      gnupg
      bash
      openssh
      pciutils
      usbutils
      dmidecode
      killall
      docker
      tmux
      toybox
      busybox
      sysstat
      lm_sensors
      fish
      distrobox
      podman
      docker
      skopeo
      lshw
    ];
    variables = {
      EDITOR = "nvim";
      NIXPKGS_ACCEPT_ANDROID_SDK_LICENSE = "1";
    };
  };

  services = {
    printing.enable = true;
    fwupd.enable = true;
    openssh.enable = true;
    samba.enable = true;
  };

  programs = {
    fish.enable = true;
    nix-ld = {
      enable = true;
    };
    command-not-found.enable = false;
  };

  system.stateVersion = "25.05";
}
