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

    # Disabling loading of nouveau drivers. Can cause issues
    boot.blacklistedKernelModules = [ "nouveau" ];

    boot.kernelParams = [
      # Silent boot options
      "quiet" "splash" "loglevel=3" "udev.log_priority=3""systemd.show_status=auto" "rd.systemd.show_status=auto" "boot.shell_on_fail" 
      # Performance options
      "nvidia-drm.modeset=1"   "amd_pstate=active"
    ];

    # Use CachyOS's kernel for better performance
    boot.kernelPackages = pkgs.linuxPackages_cachyos;

    # Systemd-boot does not support secure boot
    # Using lanzaboote instead
    boot.loader.systemd-boot.enable = lib.mkForce false;

    # Limit the amount of derivations to 5
    boot.loader.systemd-boot.configurationLimit = 5;
    boot.loader.systemd-boot.consoleMode = "max";

    # Don't show bootloader at startup
    boot.loader.timeout = 0;

    # Use lanzaboote instead of systemd for secure boot
    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    # Plymouth hides verbose text and shows a normal loading screen
    boot.plymouth.enable = true;
    boot.plymouth.theme = "breeze";

    # Performance optimizations
    boot.kernel.sysctl = {
      "vm.vfs_cache_pressure" = 50;
      "vm.swappiness" = 10;
      "vm.max_map_count" = lib.mkForce 2147483642;
    };

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    hardware.bluetooth.settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };

    # Enable control for monitor brightness
    hardware.i2c.enable = true;

    # Scanner setup
    hardware.sane.enable = true;
    hardware.sane.disabledDefaultBackends = [ "escl" ];
    hardware.sane.extraBackends = [ pkgs.sane-airscan ];

    # Explicitly enable OpenGL with 32bit support
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    # Use latest NVIDIA drivers from CachyOS
    hardware.nvidia.package = pkgs.nvidia_cachyos;
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;

    # Without this, PC won't sleep properly as gpu vram will not be saved
    hardware.nvidia.powerManagement.enable = true;
    hardware.nvidia.powerManagement.finegrained = false;

    # Reduces latency (I think)
    hardware.nvidia.forceFullCompositionPipeline = false;

    # Installs drivers for my G Pro X
    hardware.logitech.wireless.enable = true;
    hardware.keyboard.qmk.keychronSupport = true;

    # Could be required for some controllers
    hardware.uinput.enable = true;

    hardware.enableAllFirmware = true;

    # Enables controlling of PC RGB from software
    services.hardware.openrgb.enable = true;

    # Enables NVIDIA drivers
    services.xserver.videoDrivers = [ "nvidia" ];

    # Enables a different scheduler for better latency and performance
    services.scx.enable = true;
    services.scx.scheduler = "scx_lavd";

    networking.hostName = "pc";

    # Keeps WiFi enabled while PC sleeps
    networking.networkmanager.wifi.powersave = false;

    environment.sessionVariables.PLASMA_PRELOAD_POLICY = "aggressive";

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
