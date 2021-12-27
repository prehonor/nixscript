with import <nixpkgs> {}; 
mkShell rec {
  name = "patchCppTools";

  buildInputs = [
    autoPatchelfHook
    libselinux
    fontconfig
    electron
    systemd
    gtk3 webkitgtk gdk-pixbuf
    cairo pango libpulseaudio glib alsaLib libdrm mesa
    nss expat dbus nspr atk cups utillinux at_spi2_atk at-spi2-core

    xorg.libSM 
    xorg.libX11 xorg.libICE xorg.libXrender xorg.libXext xorg.libXtst xorg.libXt xorg.libXtst
    xorg.libXi xorg.libXinerama xorg.libXcursor xorg.libXrandr xorg.libXcomposite xorg.libXfixes xorg.libXdamage xorg.libxcb  xorg.libXScrnSaver
   
    gnome2.gnome_vfs gnome2.GConf

  ];
  
  ld = lib.makeLibraryPath ([
      stdenv.cc.cc.lib fontconfig.lib #  zlib 
  ] ++ buildInputs );


   shellHook = ''
     interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
     rpath=${ld}
     

    export QT_DEBUG_PLUGINS=1
    
    export XDG_DATA_DIRS=$XDG_DATA_DIRS:"${gtk3}/share/gsettings-schemas/${gtk3.name}" # also right

     export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/home/prehonor/Public/Program/baidulibs":"/home/prehonor/Public/Program/baidunetdisk":${ld}
    # export LD_PRELOAD="/home/prehonor/Public/Program/baidunetdisk/libbrowserengine.so:/home/prehonor/Public/Program/baidunetdisk/libkernel.so":$LD_PRELOAD
    # find . -type f -perm -0100 -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
    '';
}

