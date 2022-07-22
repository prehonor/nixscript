with import <nixpkgs> { };
mkShell rec {
  name = "unname";
  buildInputs = [
    #   fontconfig
    #  qt5Full
    #  glibc
    # cairo pango
    # xorg.libX11 xorg.libSM xorg.libXxf86vm
    glib
    libGL
    # gtk3 gtk2
    # gnome2.gnome_vfs gnome2.GConf
  ];

  ld = stdenv.lib.makeLibraryPath ([
    #      stdenv.cc.cc.lib 
    zlib
  ] ++ buildInputs);

  #     find ./bin -type f -perm -0100 \
  #         -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
  shellHook = ''
    interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
    rpath=${ld}
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
    # find . -type f -perm -0100 -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
  '';
}
