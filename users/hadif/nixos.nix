{ pkgs, ... }: {
  users.users.hadif = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOFIuCmNImZULF8d1H3iMo+BJK8pBifGD6tFAC+jKtfs hadif@framework"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGeiOwS/Xjr4JIgmCMJB6O9YrBw5aTwKoIExioJN3bQa hadif@nixos"
    ];
    shell = pkgs.fish;
  };
}
