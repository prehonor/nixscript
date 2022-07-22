with import <nixpkgs> {}; 
mkShell rec {
  name = "wf-info";
  
  buildInputs = [
    pango cairo wayfire wf-config wlroots wayland wayland-protocols libxkbcommon
  ];

  nativeBuildInputs = [ meson ninja pkg-config cmake wayland ];

  shellHook = ''

    '';
    
}
