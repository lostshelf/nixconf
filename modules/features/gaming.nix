{ self, inputs, ...}: {
  flake.nixosModules.gaming = { pkgs, lib, config, ... }: {
    programs.gamemode.enable = true;

    programs.gamescope = {
      enable = true;
      enableWsi = true;
      capSysNice = false;
    };

    hardware.steam-hardware.enable = true;
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      protontricks.enable = true;
      package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
          proton-cachyos
          gamescope
          gamemode
          libxcursor
          libxi
          libxinerama
          libxscrnsaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      protonup-qt
      protonplus
      lutris
      steam-run
      dxvk
      mangohud
      r2modman
      prismlauncher
      xenia-canary
      wineWow64Packages.waylandFull
      unixbench
      geekbench
      ryubing
      rpcs3
      winetricks
      bottles
      umu-launcher
      eden
      tkmm
      balatro-mod-manager
    ];

    # Add `PRESSURE_VESSEL_FILESYSTEMS_RW=$XDG_RUNTIME_DIR/wivrn/comp_ipc %command%` to launch options of VR game
    services.wivrn = {
      enable = true;
      openFirewall = true;
      autoStart = true;
      package = (pkgs.wivrn.override { cudaSupport = true; });
    };

    services.monado = {
       enable = true;
    };

    systemd.user.services.monado.environment = {
      STEAMVR_LH_ENABLE = "1";
      XRT_COMPOSITOR_COMPUTE = "1";
    };

    preservation.preserveAt."/persistent".users.hadif = {
      directories = [
        ".local/share/Steam"
        ".local/share/PrismLauncher"
        ".local/share/Terraria"
        ".config/r2modmanPlus-local"
        ".local/share/monado"
        ".steam"
        ".cache/nv_shader_cache"
      ];
    };
  };
}
