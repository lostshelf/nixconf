{
  pkgs,
  config,
  username,
  ...
}: {
  home.packages = with pkgs; [
    google-chrome
    aria2
    qbittorrent-enhanced
    deluge
  ];

  programs = {
    firefox = {
      enable = true;
      profiles.${username} = {};
    };
  };
}
