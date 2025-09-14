{ pkgs, ... }: {
  services = {
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
      autoLogin.enable = false;
      defaultSession = "plasma";
    };
    desktopManager.plasma6.enable = true;
    dbus.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs.kdePackages; [ xdg-desktop-portal-kde ];
    config.common.default = "kde";
  };

  environment.sessionVariables = {
    GTK_USE_PORTAL = "1";
  };

  security.pam.services.kdewallet.enable = true;

  environment.systemPackages = let
    npkgs = with pkgs; [
      kdiff3
      hardinfo2
      isoimagewriter
      wayland-utils
      wl-clipboard
      krename
      kile
      kid3-kde
    ];
    kpkgs = with pkgs.kdePackages; [
      discover
      kcalc
      kcharselect
      kcolorchooser
      kolourpaint
      ksystemlog
      sddm-kcm
      kate
      plymouth-kcm
      sddm-kcm
      plasma-firewall
      kwallet-pam
      flatpak-kcm
      kde-gtk-config
      wacomtablet
      ark
      kio
      kio-extras
      kio-admin
      kio-gdrive
      keditbookmarks
      kcalc
      kwallet-pam
      kinfocenter
      plasma-browser-integration
      colord-kde
      krohnkite
      ksystemlog
      kcolorchooser
      kcolorpicker
      partitionmanager
      plasma-thunderbolt
      plasma-disks
      kwave
      kunitconversion
      kup
      ktorrent
      ksshaskpass
      krunner
      kruler
      krfb
      krdc
      kpipewire
      kpat
      konqueror
      kompare
      kmplot
      kmousetool
      kmines
      kmail
      kio-zeroconf
      kio-fuse
      kgpg
      kget
      kfind
      kdevelop
      kdenetwork-filesharing
      kdeconnect-kde
      kamera
      kalgebra
      kalarm
      kactivitymanagerd
      kaccounts-integration
      isoimagewriter
      filelight
      elisa
      kdenlive
      plasma-vault
      plasma-activities
      plasma-activities-stats
      kactivitymanagerd
    ];
  in
    npkgs ++ kpkgs;
}
