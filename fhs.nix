 { pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:

(pkgs.buildFHSUserEnv {
  name = "julia";
  targetPkgs = pkgs: (with pkgs;
    [   
      jdk
      julia
      autoconf
      binutils
      coreutils
      gnumake
      m4
      pkgconfig
      stdenv.cc.cc.lib
      stdenv.cc
      utillinux
     # ffmpeg
      curl
      git
      gcc
     # cairo
      fontconfig
      freetype
      gettext
      glib
      libintl
      libpng
      libffi
      librsvg
      pango
      pixman
      zlib

    ] ++ (with pkgs.xorg;
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
      # libQtGui
      qt4
    ]) ++ (with pkgs;
    [
     fuse3
    ]));
    profile = ''
      export JAVA_HOME=${pkgs.jdk.home}
      unset http_proxy
      unset https_proxy
    '';
  runScript = "bash";
}).env
