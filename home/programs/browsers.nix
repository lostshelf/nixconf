{
  pkgs,
  config,
  username,
  ...
}: {
  home.packages = with pkgs; [
    google-chrome
    aria2
  ];

  programs = {
    firefox = {
      enable = true;
      profiles.${username} = {};
    };
  };
}
