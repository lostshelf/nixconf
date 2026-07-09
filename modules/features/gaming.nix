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
      lutris
      steam-run
      dxvk
      mangohud
      r2modman
      prismlauncher
    ];

    preservation.preserveAt."/persistent".users.hadif = {
      directories = [
        ".local/share/Steam"
        ".local/share/PrismLauncher"
        ".local/share/Terraria"
        ".config/r2modmanPlus-local"
      ];
    };
  };
}
