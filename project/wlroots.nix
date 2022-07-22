with import <nixpkgs> {}; 
mkShell rec {
  name = "wlroots";
  
  buildInputs = with xorg; [
    libGL wayland wayland-protocols libinput libxkbcommon pixman
    xcbutilwm libX11 libcap xcbutilimage xcbutilerrors mesa
    libpng ffmpeg xcbutilrenderutil seatd vulkan-loader xwayland
  ];

  nativeBuildInputs = [ meson ninja pkg-config wayland-scanner glslang ];

  shellHook = ''

    '';
    
}
