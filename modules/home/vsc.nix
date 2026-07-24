{ self, inputs, ... }: {
  flake.homeModules.vscConfig = { pkgs, ... }: let
    ovsxFixed = pkgs.nix-vscode-extensions.usingFixesFrom pkgs;
  in {
    programs.vscodium = {
      enable = true;
      package = pkgs.vscodium.fhsWithPackages (ps: with ps; [ rustup zlib ]);
      profiles.default.enableUpdateCheck = false;
      profiles.default.enableExtensionUpdateCheck = false;
      profiles.default.extensions = (with pkgs.vscode-extensions; [
        james-yu.latex-workshop
        tecosaur.latex-utilities
        formulahendry.code-runner
        ms-azuretools.vscode-containers
        ms-vscode.hexeditor
        ms-vscode.live-server
        ms-vscode.cmake-tools
        ms-vscode.makefile-tools
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode-remote.remote-containers
        jnoortheen.nix-ide
        nimlang.nimlang
        haskell.haskell
        christian-kohler.npm-intellisense
        ecmel.vscode-html-css
        vadimcn.vscode-lldb
        mkhl.direnv
        editorconfig.editorconfig
        usernamehw.errorlens
      ]) ++ (with ovsxFixed.open-vsx; [
        nromanov.dotrush
        rust-lang.rust-analyzer
        fill-labs.dependi
        bradlc.vscode-tailwindcss
        ms-python.python
        llvm-vs-code-extensions.vscode-clangd
        tamasfe.even-better-toml
        charliermarsh.ruff
        datakurre.devenv
      ]);
      profiles.default.userSettings = {
        # Add user settings here as key-value pairs
      };
    };
  };
}
