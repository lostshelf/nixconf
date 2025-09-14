{
 pkgs,
 ...
}: {
  home.packages = with pkgs; [
    
  ];

  programs = {
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
