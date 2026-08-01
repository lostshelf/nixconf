{ self, inputs, ... }: {
  flake.homeModules.vscConfig = { pkgs, ... }: let
    ovsxFixed = pkgs.nix-vscode-extensions.usingFixesFrom pkgs;
  in {
    programs.vscodium = {
      enable = true;
      package = pkgs.vscodium.fhsWithPackages (ps: with ps; [
        git
        openssh
        docker
        lldb
        zlib

        gcc
        clang
        clang-tools

        direnv
        devenv

        rustup
        rust-analyzer
        cargo

        python3

        nim
        nimble
        
        go
        gopls

        nil
        
        ruff
        dotnet-sdk

        ghc
        cabal-install

        texlive.combined.scheme-full

        jdk21
        maven
        gradle
        jdt-language-server

        dotnet-sdk

        nodejs
        typescript-language-server

        luajitPackages.lua
        luajitPackages.luarocks
        luajitPackages.lua-lsp

        yaml-language-server
        
        kotlin-language-server

        ansible-language-server

        tailwindcss-language-server

        terraform-ls

        glsl_analyzer

        systemd-language-server

        asm-lsp

        nasm

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
        editorconfig.editorconfig
        dbaeumer.vscode-eslint
        ms-vscode.js-debug
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
