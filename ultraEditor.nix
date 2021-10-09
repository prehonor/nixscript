with import <nixpkgs> {}; 
mkShell rec {
  name = "patchCppTools";
  buildInputs = [
    fontconfig
  gtk3 webkitgtk gdk-pixbuf
  cairo pango
  xorg.libX11 xorg.libSM xorg.libXxf86vm
  glib
  # gnome2.gnome_vfs gnome2.GConf
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib zlib
  ] ++ buildInputs );

#     find ./bin -type f -perm -0100 \
#         -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
  shellHook = ''
    interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
    rpath=${ld}
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
    # find . -type f -perm -0100 -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
    '';
}