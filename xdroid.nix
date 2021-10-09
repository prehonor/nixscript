with import <nixpkgs> {}; 
mkShell rec {
  name = "patchCppTools";
  buildInputs = [
    # fontconfig
   systemd
   libpulse
  gtk3 webkitgtk gdk-pixbuf  # gnome3.defaultIconTheme
	cairo pango
	libsecret  # 这个库没用但还是加上吧
  libdrm mesa # typora 用到的加上 
  xorg.libSM libpulseaudio libGL qt5.qtbase qt5.qtsvg # OnlyOffice 用到
	xorg.libX11 xorg.libICE xorg.libXrender xorg.libXext xorg.libXtst xorg.libXt xorg.libXtst
    xorg.libXi xorg.libXinerama xorg.libXcursor xorg.libXrandr xorg.libXcomposite xorg.libXfixes xorg.libXdamage xorg.libxcb  xorg.libXScrnSaver #  xorg.libXv
	alsaLib nss expat dbus nspr atk cups utillinux glib at_spi2_atk at-spi2-core
	# gnome2.gnome_vfs gnome2.GConf
	# libxml2 libav_0_8 ffmpeg libxslt libGL
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib zlib systemd.lib  # fontconfig.lib 
  ] ++ buildInputs );

#     find ./bin -type f -perm -0100 \
#         -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
   shellHook = ''
     interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
     rpath=${ld}
    # export GSETTINGS_SCHEMA_DIR=${glib.getSchemaPath gtk3} # right
      
    # export GSETTINGS_SCHEMAS_PATH=${glib.getSchemaPath gtk3}  # wrong
    # export XDG_DATA_DIRS=$XDG_DATA_DIRS:$GSETTINGS_SCHEMAS_PATH # wrong
    
    # export XDG_DATA_DIRS=$XDG_DATA_DIRS:"${gsettings-desktop-schemas}/share/gsettings-schemas/${gnome3.gsettings-desktop-schemas.name}":"${hicolor-icon-theme}/share"
    # export GIO_EXTRA_MODULES="${lib.getLib dconf}/lib/gio/modules"
    # export GI_TYPELIB_PATH="${lib.makeSearchPath "lib/girepository-1.0" [ pango json-glib ]}"
    # export QT_DEBUG_PLUGINS=1
    export XDG_DATA_DIRS=$XDG_DATA_DIRS:"${gtk3}/share/gsettings-schemas/${gtk3.name}" # also right
    export QT_PLUGIN_PATH=/home/prehonor/Downloads/xDroidInstall-x86_64/data  # ONLYOFFICE
    # export QT_QPA_PLATFORM_PLUGIN_PATH=/home/prehonor/Public/Program/desktopeditors/platforms # ONLYOFFICE
    # export PATH=$PATH:"/home/prehonor/Public/Program/figma-linux-0.6.2"
     export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
    # find . -type f -perm -0100 -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
    '';
}