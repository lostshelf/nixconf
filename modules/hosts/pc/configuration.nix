{ self, inputs, ... }: {
  flake.nixosModules.pcConfig = { pkgs, lib, config,  ... }: {
    imports = [
      inputs.nix-index-database.nixosModules.default

      self.nixosModules.nixConfig

      self.nixosModules.pcHardwareConfig
      self.nixosModules.pcDiskoConfig
      self.nixosModules.pcPreservationConfig

      self.nixosModules.homeConfig

      self.nixosModules.kdeConfig
      self.nixosModules.devConfig

      self.nixosModules.gaming
      self.nixosModules.apps

    ];

    boot.plymouth.enable = true;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "pc";
    networking.networkmanager.enable = true;
    networking.enable = true;
    networking.firewall = {
      enable = true;
      trustedInterfaces = [ config.services.tailscale.interfaceName ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };

    time.timeZone = "America/Edmonton";
    i18n.defaultLocale = "en_CA.UTF-8";
    i18n.extraLocaleSettings = {
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

    fonts.fontconfig.useEmbeddedBitmaps = true;
    fonts.fontDir.enable = true;
    fonts.packages = with pkgs; [
      corefonts

      material-design-icons

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ];

    users.users.hadif = {
      isNormalUser = true;
      description = "Hadi Faraz";
      extraGroups = [ "wheel" "networkmanager" "dialout" "docker" "i2c" "flatpak" "video" "render" "input" "uinput" "gamemode" ];
      hashedPassword = "$y$j9T$MMPAhWeSbaZ7zbfOs0U9t.$nD7OM/BMkvgM5HYL6SpwN5HiTd6CtfDxYCxb583rbP9";
      shell = pkgs.fish;
    };
    users.groups.libvirtd.members = [ "hadif" ];

    environment.systemPackages = with pkgs; [
      fishPlugins.tide
      droidcam
      scrcpy
    ];

    programs.nix-index-database.comma.enable = true;

    programs.firefox.enable = true;

    programs.git = {
      enable = true;
      lfs.enable = true;
    };

    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-qt;
    };

    programs.ssh = {
      startAgent = true;
      enableAskPassword = true;
      askPassword = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
    };

    programs.fish.enable = true;
    programs.nix-ld.enable = true;
    programs.command-not-found.enable = false;

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/hadif/Documents/nixos_new";
    };

    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-vaapi
        droidcam-obs
      ];
    };

    programs.gpu-screen-recorder.enable = true;

    services.openssh.enable = true;
    services.flatpak.enable = true;
    services.printing.enable = true;
    services.fwupd.enable = true;
    services.tailscale.enable = true;

    systemd.services.tailscaled.serviceConfig.Environment = [
      "TS_DEBUG_FIREWALL_MODE=nftables"
    ];

    systemd.network.wait-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;

    virtualisation.spiceUSBRedirection.enable = true;
    virtualisation.libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
    virtualisation.docker.enable = true;

    system.stateVersion = "26.05";
  };
}
