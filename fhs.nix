 { pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:

(pkgs.buildFHSUserEnv {
  name = "julia";
  targetPkgs = pkgs: (with pkgs;
    [       
      julia
      autoconf
      binutils
      coreutils
      gnumake
      m4
      pkgconfig
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
      qt5.full
    ]));
    extraBuildCommands = ''
     # ex
    '';
  runScript = "bash";
}).env
