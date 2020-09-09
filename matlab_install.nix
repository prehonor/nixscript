{ pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:

(pkgs.buildFHSUserEnv {
  name = "matlab_install_start";
  targetPkgs = pkgs: (with pkgs;
    [ udev
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
  # runScript = "bash"; # 安装时用
  runScript = "/ah/prehonor/Programmers/R2019a/bin/matlab";  #安装后使用
}).env