{ self, inputs, ... }: {
 flake.nixosModules.pcHardwareConfig = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    console.earlySetup = false;

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    boot.initrd.systemd.enable = true;
    boot.initrd.verbose = false;
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];
    boot.blacklistedKernelModules = [ "nouveau" ];
    boot.kernelParams = [ "quiet" "splash" "nvidia.NVreg_EnableGpuFirmware=0" "nvidia-drm.modeset=1" "loglevel=3" "boot.shell_on_fail" "udev.log_priority=3""systemd.show_status=auto" "rd.systemd.show_status=auto" "amd_pstate=active"];
    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 5;
    boot.loader.systemd-boot.consoleMode = "max";
    boot.loader.timeout = 0;

    boot.plymouth.enable = true;
    boot.plymouth.theme = "breeze";

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    hardware.i2c.enable = true;

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.powerManagement.enable = true;
    hardware.nvidia.powerManagement.finegrained = false;
    hardware.nvidia.forceFullCompositionPipeline = false;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

    hardware.uinput.enable = true;

    hardware.enableAllFirmware = true;

    services.xserver.videoDrivers = [ "nvidia" ];

    networking.hostName = "pc";
    networking.networkmanager.wifi.powersave = false;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
