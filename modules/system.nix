{ pkgs, lib, unstable, username, config, ...}: {
  boot.plymouth.enable = true;

  users.users.danif = {
    isNormalUser = true;
    description = "Daniyal Faraz";
    hashedPassword = "$6$xJTUGzkqNfZKjW7O$csMz3bFAgNs7nvTzVWF/vyvvz9RdtSiNzTAgIx18ZR5V1XnFQtW/j2y6ekj.YF3niqwNis.IgS7HpBdVZCGu8.";
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    steam-hardware.enable = true;
  };

  virtualisation = {
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

  environment = {
    variables = {

    };
    systemPackages = with pkgs; [
      firefox
      fishPlugins.tide
      xdg-utils
      flatpak
      pinentry-qt
    ];
  };

  security.rtkit.enable = true;

  services = {
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
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    joycond.enable = true;
    udev.packages = with pkgs; [
      game-devices-udev-rules
    ];
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
