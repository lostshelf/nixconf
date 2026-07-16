{ self, inputs, ... }: {
 flake.nixosModules.pcHardwareConfig = { pkgs, config, lib, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
      inputs.chaotic.nixosModules.default
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
    boot.kernelPackages = pkgs.linuxPackages_cachyos-rc;

    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 5;
    boot.loader.systemd-boot.consoleMode = "max";
    boot.loader.timeout = 0;

    boot.plymouth.enable = true;
    boot.plymouth.theme = "breeze";

    boot.kernel.sysctl = {
      "vm.vfs_cache_pressure" = 50;
      "vm.swappiness" = 10;
    };

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    hardware.i2c.enable = true;

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    hardware.nvidia.package = pkgs.nvidia_cachyos-rc;
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.powerManagement.enable = false;
    hardware.nvidia.powerManagement.finegrained = false;
    hardware.nvidia.forceFullCompositionPipeline = false;
    hardware.logitech.wireless.enable = true;
    hardware.keyboard.qmk.keychronSupport = true;

    hardware.uinput.enable = true;

    hardware.enableAllFirmware = true;

    services.xserver.videoDrivers = [ "nvidia" ];
    services.scx.enable = true;

    networking.hostName = "pc";
    networking.networkmanager.wifi.powersave = false;

    environment.sessionVariables.PLASMA_PRELOAD_POLICY = "aggressive";

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
