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
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../../modules/common.nix

    ../../modules/system.nix
    ../../modules/kde.nix
  ];

  hardware = {
    bluetooth.enable = true;
    xpadneo.enable = true;
    logitech.wireless.enable = true;
    firmware = [ pkgs.sof-firmware ];
    graphics = {
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  boot = {
    extraModprobeConfig = ''
      options iwlwifi power_save=0
      options iwlwifi bt_coex_active=0
    '';
    kernelParams = [
      "quiet" "splash" "loglevel=0" "systemd.show_status=false" "rd.systemd.show_status=false" "amd_pstate=active" "nvidia-drm.modeset=1" "console=tty0" "kvm.enable_virt_at_load=0"
      "pcie_aspm=off"
      "intel_idle.max_cstate=1"
      "nowatchdog"
      "nosoftlockup"
      "snd_hda_intel.model=alc1318-dell-headset-multi"
    ];
  };

  networking.hostName = "framework";

  environment.systemPackages = with unstable; [
    fw-fanctrl
    alsa-ucm-conf
  ];

  environment.sessionVariables = {
    KWIN_OPENGL_INTERFACE = "egl_gles";
  };

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
}
