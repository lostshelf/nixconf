# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  unstable,
  ...
}: {
  imports = [
    ../../modules/system.nix
    ../../modules/kde.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0012", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
    SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0014", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
  '';

  hardware = {
    bluetooth.enable = true;
    xpadneo.enable = true;
    logitech.wireless.enable = true;
  };

  boot = {
    extraModprobeConfig = ''
      options iwlwifi power_save=0
      options iwlwifi bt_coex_active=0
    '';
    kernelParams = [
      "pcie_aspm=off"
      "intel_idle.max_cstate=1"
      "nowatchdog"
      "nosoftlockup"
    ];
  };

  networking.hostName = "framework";

  environment.systemPackages = with unstable; [
    fw-fanctrl
  ];

  programs = {
    fw-fanctrl = {
      enable = true;
    };
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

  system.stateVersion = "25.05";
}
