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
    tor-browser
  ];

  programs = {
    firefox = {
      enable = true;
      profiles.${username} = {};
    };
  };
}
