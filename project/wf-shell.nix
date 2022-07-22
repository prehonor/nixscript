with import <nixpkgs> {}; 
mkShell rec {
  name = "wf-shell";
  
  buildInputs = [
    alsa-lib gtkmm3 gtk-layer-shell pulseaudio wayfire wf-config wlroots libepoxy
  ];

  nativeBuildInputs = [ cmake meson ninja pkg-config wayland ];

  shellHook = ''

    '';
    
}
