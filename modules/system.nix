{ pkgs, lib, unstable, username, config, ...}: {
  boot.plymouth.enable = true;

  users = {
    users = {
      danif = {
        isNormalUser = true;
        description = "Daniyal Faraz";
        hashedPassword = "$6$xJTUGzkqNfZKjW7O$csMz3bFAgNs7nvTzVWF/vyvvz9RdtSiNzTAgIx18ZR5V1XnFQtW/j2y6ekj.YF3niqwNis.IgS7HpBdVZCGu8.";
      };
    };
    groups.libvirtd.members = [ "hadif" ];

  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    steam-hardware.enable = true;
    uinput.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

  };

  virtualisation = {
    spiceUSBRedirection.enable = true;
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
    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
        enableKvm = false;
        addNetworkInterface =  true;
      };
    };
  };

  environment = {
    variables = {

    };
    systemPackages = with pkgs; [
      firefox
      fishPlugins.tide
      xdg-utils
      flatpak
      pinentry-qt
      gamemode
    ];
  };

  i18n.extraLocales = [ "es_VE.UTF-8/UTF-8" ];

  security.rtkit.enable = true;

  services = {
    flatpak.enable = true;
    upower.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    pulseaudio.enable = false;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    joycond.enable = true;
    udev = {
      packages = with pkgs; [
        game-devices-udev-rules
      ];
      extraRules = ''
        KERNEL=="card*", SUBSYSTEM=="drm", GROUP="video", MODE="0660"
        KERNEL=="renderD*",SUBSYSTEM=="drm", GROUP="video", MODE="0660"
        KERNEL=="uinput", SUBSYSTEM=="misc", TAG+="uaccess", OPTIONS+="static_node=uinput"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0660", TAG+="uaccess"
        KERNEL=="hidraw*", ATTRS{idVendor}=="28de", MODE="0660", TAG+="uaccess"
      '';
    };
  };

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with unstable; [
        proton-ge-bin
      ];
      protontricks.enable = true;
      package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
          gamescope
          gamemode
        ];
      };
    };
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
    ssh = {
      startAgent = true;
      enableAskPassword = true;
      askPassword = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
    };
  };

  nixpkgs.config.android_sdk.accept_license = true;
}
