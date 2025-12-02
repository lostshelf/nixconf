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
        libva-vdpau-driver
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
    fw-fanctrl = {
      enable = true;
    };
  };

  boot = {
    extraModprobeConfig = ''
      options iwlwifi power_save=0
      options iwlwifi bt_coex_active=0
    '';
    kernelParams = [
      "amd_pstate=active"
      "pcie_aspm=off"
      "intel_idle.max_cstate=1"
      "nowatchdog"
      "nosoftlockup"
      "snd_hda_intel.model=alc1318-dell-headset-multi"
    ];
  };

  networking.hostName = "framework";

  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs."libfprint-2-tod1-goodix";
    };
  };

  security.pam.services.sddm = {
    fprintAuth = true;
    text = "
    auth      [success=1 new_authtok_reqd=1 default=ignore]  pam_unix.so try_first_pass likeauth nullok
    auth      sufficient                                     pam_fprintd.so
    auth      substack                                       login
    account   include                                        login
    password  substack                                       login
    session   include                                        login
    ";
  };

  environment.systemPackages = with unstable; [
    fw-fanctrl
    alsa-ucm-conf
  ];

  environment.sessionVariables = {
    KWIN_OPENGL_INTERFACE = "egl_gles";
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
