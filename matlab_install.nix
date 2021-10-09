with import <nixpkgs> {};

(pkgs.buildFHSUserEnv {
  name = "matlab_install_start";
  targetPkgs = pkgs: (with pkgs;
    [ 
      libselinux
      lsb-release
      udev
      coreutils
      alsaLib
      dpkg
      gcc
      zlib
      freetype
      glib
      zlib
      fontconfig
      openssl
      which
      ncurses
      jdk11
      pam
      dbus_glib
      dbus
      pango
      gtk2-x11
      atk
      gdk_pixbuf
      cairo

      cups
      libfakeXinerama
      nss
      nspr

      # libudev0-shim libgcrypt libgudev e2fsprogs expat SDL2


    ]) ++ (with pkgs.xorg;
    [ libX11
	    libXft
      libXcursor
      libXrandr
      libXext
      libSM
      libICE
      libX11
      libXrandr
      libXdamage
      libXrender
      libXfixes
      libXcomposite
      libXcursor
      libxcb
      libXi
      libXScrnSaver
      libXtst
      libXt
      libXxf86vm


    ]);


  runScript = ''
    bash
  '';

  profile = ''
   
    export MATLABROOT=/ah/prehonor/Programmers/R2020b

  '';

}).env