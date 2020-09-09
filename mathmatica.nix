{ pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:

(pkgs.buildFHSUserEnv {
  name = "mathmatica_install_start";
  targetPkgs = pkgs: (with pkgs;
    [     
   # openjfx11
   # jdk11 
   gtk2 gtk3 webkitgtk gdk-pixbuf cairo pango
   atk 
    perl
	  lsb-release
	  udev
    coreutils
    patchelf
    alsaLib
    coreutils
    dbus
    fontconfig
    freetype
    gcc.cc
    gcc.libc
    glib
    ncurses
    opencv
    openssl
    unixODBC
    xkeyboard_config
    libxml2
    libuuid
    zlib
    libGL
    libGLU
    ]) ++ (with pkgs.xorg;
    [ 
	  libX11
    libXext
    libXtst
    libXi
    libXmu
    libXrender
    libxcb
    libXcursor
    libXfixes
    libXrandr
    libICE
    libSM
    
    libXdamage
    libXcomposite
    libXScrnSaver
    libXt
    libXxf86vm
    ]);
  runScript = "bash"; # 安装时用
 # runScript = "/ah/prehonor/Programmers/R2019a/bin/matlab";  #安装后使用
}).env