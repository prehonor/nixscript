with import <nixpkgs> {}; 
mkShell rec {
  name = "mindmaster";
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
  nativeBuildInputs = [
        #  wrapGAppsHook
        #  autoPatchelfHook
         # makeWrapper
         # dpkg
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib zlib fontconfig.lib libudev0-shim glibc curl pulseaudio
  ] ++ buildInputs );



   shellHook = ''
     interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
     rpath=${ld}

     export XDG_DATA_DIRS=$XDG_DATA_DIRS:"${gtk3}/share/gsettings-schemas/${gtk3.name}" # also right
     export QT_PLUGIN_PATH=/ah/prehonor/Programmers/MindMaster-8/

     export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}:/ah/prehonor/Programmers/MindMaster-8/lib


     export QT_XKB_CONFIG_ROOT=${xkeyboard_config}/share/X11/xkb
     unset http_proxy
     unset https_proxy
     unset ftp_proxy
     unset all_proxy

    '';
}