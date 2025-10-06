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
    initrd.systemd.enable = true;
    consoleLogLevel = 0;
    kernelParams = [ "quiet" "splash" "loglevel=0" "systemd.show_status=false" "rd.systemd.show_status=false" "udev.log_priority=0" "amd_pstate=active" ];
    kernelPackages = pkgs.linuxPackages;
  };

  hardware = {
    enableAllFirmware = true;
    firmware = with pkgs; [ linux-firmware ];
  };

  virtualisation.docker.enable = true;

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

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";

  users.users.${username} = {
    isNormalUser = true;
    description = "Hadi Faraz";
    extraGroups = ["networkmanager" "wheel" "dialout" "docker" "video" "render" "libvirtd"];
  };

  fonts = {
    packages = with pkgs; [
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
  ];

  environment.variables.EDITOR = "nvim";

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
