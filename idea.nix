with import /home/prehonor/Public/Code/nixpkgs/default.nix {}; 
mkShell rec {
  name = "jetbrainsJDKRuntime";
  
  
  buildInputs = [
    jdk11
#     gcc
#     pkg-config
#     autoconf
#     unzip zip perl file cpio
#     libxml2 libav_0_8 ffmpeg libxslt libGL
#     zlib cups freetype alsaLib libjpeg giflib
#     libpng lcms2 xorg.libX11 xorg.libICE xorg.libXrender xorg.libXext xorg.libXtst xorg.libXt xorg.libXtst
#     xorg.libXi xorg.libXinerama xorg.libXcursor xorg.libXrandr 
#    fontconfig
     yarn
     nodejs-12_x
#     gtk3 gnome2.gnome_vfs gnome2.GConf glib
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib fontconfig.lib
  ] ++ buildInputs );

#     find ./bin -type f -perm -0100 \
#         -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
  shellHook = ''
    interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
    rpath=${ld}
    export PATH=$PATH:$HOME"/.npm/bin"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
    unset http_proxy
    unset https_proxy
   # unset WEBIDE_JDK
    # find . -type f -perm -0100 -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
    '';
}
