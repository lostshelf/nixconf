final: prev: {
  mitmproxy = prev.python3Packages.mitmproxy.overrideAttrs (old: {
    pythonRelaxDeps = true;
  });

  fw-fanctrl = prev.python3Packages.fw-fanctrl.overrideAttrs (old: {
    pythonRelaxDeps = true;
  });
}
