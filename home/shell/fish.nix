{ config, ...}: {
  programs = {
  zoxide.enableFishIntegration = true;
    fish = {
      functions = {
        nixcfg = {
          enable = true;
          description = "Open /etc/nixos with Kate";
          body = ''
            kate /etc/nixos
          '';
        };
        full_upgrade = {
          enable = true;
          description = "Update channels and rebuild";
          body = ''
            cd /etc/nixos
            sudo nix flake update
            sudo nixos-rebuild switch --upgrade
          '';
        };
      };
    };
  };
}
