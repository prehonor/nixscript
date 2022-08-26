let 
  pkgs = import <nixpkgs> {};
  withGtk3 = true;
  libfm' = with pkgs; libfm.override { inherit withGtk3; };
  buildInputs = with pkgs; [
    gtk3.dev libfm' glib.dev gdk-pixbuf.dev gtksourceview.dev cairo.dev pango.dev mesa.dev readline.dev

    gnome.adwaita-icon-theme 
    zlib fontconfig jsoncpp libffi

    ecl
    perl
    docbook_xml_dtd_45 docbook_xsl_ns
    boost
    qrencode
    
    
    wayland.dev wlroots wayland-protocols wayland-scanner xwayland libxkbcommon wayland-utils xorg.libX11.dev xorg.xorgproto xorg.libXinerama.dev xorg.libXext.dev libGL.dev alsa-lib.dev harfbuzz.dev atk.dev sndio

    cmake pkg-config gnumake meson ninja flex bison media-player-info scons gcc binutils
  ];
  /*
  ld = with pkgs; lib.makeLibraryPath ([
        stdenv.cc.cc.lib fontconfig.lib gtk3 gdk-pixbuf gtksourceview 
        xorg.libXinerama xorg.libXext xorg.libX11
        libGL alsa-lib sndio
   ]);
   */
           # export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
  fhs =  with pkgs; buildFHSUserEnv {

    name = "fhs";

    targetPkgs = pkgs: buildInputs;

    runScript = ''
      bash
    '';

    profile = ''

      '';

  };
in with pkgs; stdenv.mkDerivation {

  name = "fhsenv";

  nativeBuildInputs = [ fhs ];

  shellHook = ''
    exec fhs
  '';
}
