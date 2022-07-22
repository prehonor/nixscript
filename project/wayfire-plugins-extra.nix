with import <nixpkgs> {}; 
mkShell rec {
  name = "wayfire-plugins-extra";
  
  buildInputs = [
    cairo
    glibmm
    udev
    glm
    libxkbcommon
    xorg.xcbutilwm
    pango
    wlroots
    wf-config
    wayfire
    wayland
    wayland-protocols
  ];

  nativeBuildInputs = [ cmake meson ninja pkg-config wayland wayland-protocols ];

  shellHook = ''

    '';
    
}
