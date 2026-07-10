{ self, inputs, ... }: {
  flake.nixosModules.devConfig = { pkgs, lib, config, ... }: {
    environment.systemPackages = with pkgs; [
      ghidra-bin
      frida-tools
      android-tools
      cutter
      cutterPlugins.rz-ghidra
      binutils
      binwalk
      bintools
      jadx
      avalonia-ilspy
      bytecode-viewer
      gdb
      lldb
      bingrep
    ];
  };
}
