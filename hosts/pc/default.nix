# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../../modules/common.nix

    ../../modules/system.nix
    ../../modules/kde.nix
  ];

  boot = {
    blacklistedKernelModules = [ "nouveau" ];
  };

  environment.systemPackages = with pkgs; [
    solaar
  ];

  hardware = {
    nvidia = {
      nvidiaSettings = true;
      nvidiaPersistenced = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
    xpadneo.enable = true;
    bluetooth.enable = true;
    logitech.wireless.enable = true;
    steam-hardware.enable = true;
  };

  fonts.fontconfig.antialias = true;

  programs.atop.atopgpu.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  networking = {
    hostName = "pc";
    networkmanager.wifi.powersave = false;
  };

  system.stateVersion = "25.05";
}
