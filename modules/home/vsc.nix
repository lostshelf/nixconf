{ self, inputs, ... }: {
  flake.homeModules.vscConfig = { pkgs, ... }: let
    ovsxFixed = pkgs.nix-vscode-extensions.usingFixesFrom pkgs;
  in {
    programs.vscodium = {
      enable = true;
      package = pkgs.vscodium.fhsWithPackages (ps: with ps; [
        git
        rustup
        python3
        nim
        nimble
        go
        lldb
        zlib

        direnv
        devenv
        nil
        clang-tools
        ruff
        dotnet-sdk

        ghc
        cabal-install

        openssh
        docker

        texlive.combined.scheme-medium

        jdk21
        maven
        gradle

        dotnet-sdk
      ]);
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
        ms-dotnettools.csharp
        jnoortheen.nix-ide
        nimlang.nimlang
        haskell.haskell
        christian-kohler.npm-intellisense
        ecmel.vscode-html-css
        vadimcn.vscode-lldb
        mkhl.direnv
        editorconfig.editorconfig
        usernamehw.errorlens
        vscjava.vscode-java-debug
        vscjava.vscode-maven
        vscjava.vscode-gradle
        vscjava.vscode-java-dependency
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
