{ self, inputs, ... }: {
  flake.homeModules.vscConfig = { pkgs, ... }: {
    programs.vscode = {
      enable = true;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        bungcip.better-toml
        tamasfe.even-better-toml
        james-yu.latex-workshop
        tecosaur.latex-utilities
        formulahendry.code-runner
      ];
    };
  };
}
