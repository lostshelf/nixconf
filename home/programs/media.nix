{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    spotify
    vlc
    ffmpeg
    dvgrab
    rustdesk
    protonmail-bridge-gui
    virt-manager
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [pkgs.mpvScripts.mpris];
    };

    obs-studio.enable = true;
  };
}
