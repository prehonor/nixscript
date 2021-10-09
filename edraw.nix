with import <nixpkgs> {}; 
mkShell rec {
  name = "edraw";

  runtimeLibs = lib.makeLibraryPath [
    curl
    glibc
    libudev0-shim
    pulseaudio
  ];
  buildInputs = [
      alsaLib
    at-spi2-atk
    atk
    cairo
    dbus
    dconf
    fontconfig
    gdk-pixbuf
    glib
    gsettings-desktop-schemas
    gst_all_1.gst-plugins-base
    gst_all_1.gstreamer
    gtk2
    gtk3
    libpulseaudio
    libdrm
    nspr
    nss
    qt5.qtbase
    qt5.qtdeclarative
    qt5.qtsvg
    libsForQt5.qt3d
    libsForQt5.kproperty 
    libsForQt5.qt5.qtsensors
   # libsForQt5.qt5.qtgamepad
   # libsForQt5.qt5.qtserialbus
    xorg.libX11
    xorg.libxcb
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXScrnSaver
    xorg.libXtst



    e2fsprogs
  ];
  nativeBuildInputs = [
      autoPatchelfHook
      dpkg
      makeWrapper
      wrapGAppsHook
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib zlib fontconfig.lib libudev0-shim glibc curl pulseaudio
  ] ++ buildInputs );

   shellHook = ''
    export LD_LIBRARY_PATH="${runtimeLibs}"
    export QT_XKB_CONFIG_ROOT="${xkeyboard_config}/share/X11/xkb"
    export QTCOMPOSE="${xorg.libX11.out}/share/X11/locale"

    export QT_QPA_PLATFORM="xcb"
    '';
}

/*

with import <nixpkgs> {}; 
mkShell rec {
  name = "edraw";
  buildInputs = [
      gnome3.gsettings_desktop_schemas
      glib
      gtk3
      gtk2
      cairo
      atk
      gdk-pixbuf
      at-spi2-atk
      dbus
      dconf
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base

      qt515_my.qtsvg
      qt515_my.qtsensors
      qt515_my.qt3d
      qt515_my.qtgamepad
      qt515_my.qttools
      qt515_my.qtserialbus
      qt515_my.qtserialport

      libdrm
      libxkbcommon
      pango
      cups

      postgresql.lib

      xorg.libX11
      xorg.libxcb
      xorg.xkeyboardconfig
      xorg.libXi
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXrandr
      xorg.libXcomposite
      xorg.libXext
      xorg.libXfixes
      xorg.libXrender
      xorg.libXtst
      xorg.libXScrnSaver
      nss
      nspr
      alsaLib
      libpulseaudio
      fontconfig


      libGL
      freetype
      expat
      xkeyboard_config
      krb5
      e2fsprogs

      p11-kit
      libgpgerror
  ];

  
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib zlib fontconfig.lib libudev0-shim glibc curl pulseaudio
  ] ++ buildInputs );

   shellHook = ''
     interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
     rpath=${ld}

    export XDG_DATA_DIRS=$XDG_DATA_DIRS:"${gtk3}/share/gsettings-schemas/${gtk3.name}"
    export QT_PLUGIN_PATH=/ah/prehonor/Programmers/EdrawMax-10

     export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}:/ah/prehonor/Programmers/EdrawMax-10/lib
     export QT_XKB_CONFIG_ROOT=${xkeyboard_config}/share/X11/xkb
     unset http_proxy
     unset https_proxy
     unset ftp_proxy
     unset all_proxy

    '';
}
*/