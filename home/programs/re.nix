{ lib, pkgs, unstable, ... }: {
  home.packages = with unstable; [
    rizin
    cutter
    (lib.hiPrio cutterPlugins.rz-ghidra)
    (lib.lowPrio rizinPlugins.rz-ghidra)
    frida-tools
    android-tools
    apktool
    jadx
    # mitmproxy # fsr isnt building (as of 2025-08-27)
    metasploit
    ltrace
    strace
    ghidra
    upx
    binwalk
    hexedit
    ghex
    gdb
    lldb
    rr
    wireshark
    tcpdump
    retdec
    ropgadget
    gdb-dashboard
    just
    bytecode-viewer
    imhex
    recaf-launcher
    procyon
    _010editor
    wxhexeditor
    valgrind
    yara
    steghide
  ];
}
