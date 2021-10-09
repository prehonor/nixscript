with import <nixpkgs> {}; 
mkShell rec {
  name = "patchCppTools";
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
          qt5.qtbase
          qt5.qtdeclarative
          qt5.qtsvg
          xorg.libX11
          xorg.libxcb
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
          fontconfig
          libpulseaudio
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
     libudev0-shim glibc curl pulseaudio
  ] ++ buildInputs);

   shellHook = ''
     interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
     rpath=${ld}

     export QT_DEBUG_PLUGINS=1
    
     export XDG_DATA_DIRS=$XDG_DATA_DIRS:"${gtk3}/share/gsettings-schemas/${gtk3.name}" # also right
     export QT_PLUGIN_PATH=/home/prehonor/Public/Program/desktopeditors  # ONLYOFFICE
     export QT_QPA_PLATFORM_PLUGIN_PATH=/home/prehonor/Public/Program/desktopeditors/platforms # ONLYOFFICE
     export PATH=$PATH:"/home/prehonor/Public/Program/figma-linux-0.6.2"
     export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
     unset http_proxy
     unset https_proxy
     unset ftp_proxy
    # find . -type f -perm -0100 -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
    '';
}