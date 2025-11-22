# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  unstable,
  lib,
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
    kernelModules = [ "hid_nintendo" ];
    kernelParams = [ "nvidia.NVreg_EnableGpuFirmware=0" ];
    blacklistedKernelModules = [ "nouveau" ];
    extraModprobeConfig = ''
      options hid_steam hidraw_only=0
    '';
    initrd = {
      kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    };
  };

  environment.systemPackages = let
    stble = with pkgs; [
      egl-wayland
      solaar
      moonlight
    ];
    ustble = with unstable; [
      sunshine
      gpu-screen-recorder
    ];
  in
    ustble ++ stble;

  security.wrappers = {
    sunshine = {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+p";
      source = "${pkgs.sunshine}/bin/sunshine";
    };
  };

  hardware = {
    nvidia = {
      nvidiaSettings = true;
      nvidiaPersistenced = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      forceFullCompositionPipeline = false;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
    xpadneo.enable = true;
    bluetooth.enable = true;
    logitech.wireless.enable = true;
    steam-hardware.enable = true;
  };

  environment.sessionVariables = {
    KWIN_OPENGL_INTERFACE = "egl_gles";
  };

  fonts.fontconfig.antialias = true;

  programs = {
    atop.atopgpu.enable = true;
    gamemode.enable = true;
  };
  services = {
    xserver.videoDrivers = [ "nvidia" ];
    power-profiles-daemon.enable = true;
    avahi = {
      publish = {
        enable = true;
        userServices = true;
      };
    };
    udev.extraRules = ''
      SUBSYSTEM=="input", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="3106", MODE="0660", GROUP="input"
      ACTION=="add", ATTRS{idVendor}=="28de", ATTRS{idProduct}=="11ff", RUN+="${pkgs.kmod}/bin/modprobe hid_steam"
      SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="2073", MODE="0666"
      ACTION=="add", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="2069", RUN+="/bin/sh -c 'modprobe -r hid_generic; modprobe hid_nintendo'"
    '';
    joycond.enable = true;

  };

  networking = {
    hostName = "pc";
    networkmanager.wifi.powersave = false;
    firewall = {
      allowedTCPPorts = [ 47984 47989 47990 48010 ];
      allowedUDPPortRanges = [
        { from = 47998; to = 48000; }
        { from = 8000; to = 8010; }
      ];
    };
  };

  system.stateVersion = "25.05";
}
