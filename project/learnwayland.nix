with import <nixpkgs> {}; 
mkShell rec {
  name = "wlrootstest";
  
  buildInputs = with xorg; [
    cairo doctest libdrm libexecinfo libinput libjpeg libxkbcommon wayland
    wayland-protocols wf-config wlroots_x mesa pango
    vulkan-headers vulkan-loader xwayland xorg.xcbutilrenderutil 
    glslang xorg.xcbutilerrors seatd xorg.xcbutilwm
    libevdev nlohmann_json
  ];

  nativeBuildInputs = [ cmake meson ninja  pkg-config wayland wayland-scanner ];

  shellHook = ''
        
    '';
    
}
