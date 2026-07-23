{ self, inputs, ... }: {
  flake.homeModules.vscConfig = { pkgs, ... }: {
    programs.vscode = {
      enable = true;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        james-yu.latex-workshop
        tecosaur.latex-utilities
        formulahendry.code-runner
        ms-azuretools.vscode-containers
        ms-python.python
        ms-vscode.hexeditor
        ms-vscode.live-server
        ms-vscode.cmake-tools
        ms-vscode.makefile-tools
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.cpptools-extension-pack
        ms-vscode-remote.remote-containers
        ms-vscode-remote.vscode-remote-extensionpack
        fill-labs.dependi
      ];
    };

    programs.vscodium = {
      enable = true;
      package = pkgs.vscodium-fhs;
      profiles.default.enableUpdateCheck = false;
      profiles.default.enableExtensionUpdateCheck = false;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        james-yu.latex-workshop
        tecosaur.latex-utilities
        formulahendry.code-runner
        ms-azuretools.vscode-containers
        ms-python.python
        ms-vscode.hexeditor
        ms-vscode.live-server
        ms-vscode.cmake-tools
        ms-vscode.makefile-tools
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.cpptools-extension-pack
        ms-vscode-remote.remote-containers
        ms-vscode-remote.vscode-remote-extensionpack
        fill-labs.dependi
      ];
    };
  };
}
