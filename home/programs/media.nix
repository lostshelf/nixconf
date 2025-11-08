{
  pkgs,
  unstable,
  config,
  ...
}: {
  home.packages = with unstable; [
    spotify
    vlc
    ffmpeg
    dvgrab
    rustdesk
    protonmail-bridge-gui
    virt-manager
    scrcpy
    airtame
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
