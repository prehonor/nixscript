with import <nixpkgs> {}; 
(mkShell.override { stdenv = llvmPackages_11.stdenv; }) rec {
  name = "lispenv";
  withGtk3 = true;
  libfm' = libfm.override { inherit withGtk3; };
  buildInputs = [
    gtk3 libfm' glib gdk-pixbuf gtksourceview cairo pango mesa
    gtkmm3 gtksourceviewmm 
    gnome.adwaita-icon-theme 
    zlib fontconfig jsoncpp libffi

    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qtdeclarative
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtwebchannel
    libsForQt5.qt5.qtwebsockets
    libsForQt5.qt5.qtwebengine
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qttools
    libsForQt5.qt5.qtmultimedia
    libsForQt5.qt5.qtnetworkauth
    # libsForQt5.polkit-qt
    libsForQt5.qgpgme
    # libsForQt5.solid
    readline
    llvmPackages_11.libclang
    llvmPackages_11.libcxx
    llvmPackages_11.llvm
    ecl
    perl perlPackages.IOSocketSSL perlPackages.YAMLPP perlPackages.URI
    docbook_xml_dtd_45 docbook_xsl_ns
    pcre polkit libselinux libsepol util-linux
    libgcrypt
    boost
    lmdb
    networkmanager
    qrencode libdmtx
    sndio
    libGL SDL2 SDL2_ttf SDL2_image sfml
  ];
  BINDGEN_EXTRA_CLANG_ARGS =
    # Includes with normal include path
    (builtins.map (a: ''-I"${a}/include"'') [
      glibc.dev
    ])
    # Includes with special directory paths
    ++ [
      ''-I"${libclang.lib}/lib/clang/${libclang.version}/include"''
      ''-I"${glib.dev}/include/glib-2.0"''
      "-I${glib.out}/lib/glib-2.0/include/"
      "-I${libcxx.dev}/include/c++/v1"
    ];
  RUSTFLAGS = (builtins.map (a: "-L ${a}/lib") [
    # libvmi # 需要 export NIXPKGS_ALLOW_INSECURE=1
  ]);
  nativeBuildInputs = [ cmake corrosion # Tool for integrating Rust into an existing CMake project
   pkg-config gnumake meson ninja libsForQt5.qt5.qmake
  flex bison media-player-info scons ];

  libpaths = lib.makeLibraryPath [ gtk3 libfm' glib cairo pango libjpeg curl openssl gdk-pixbuf ];

  cmakeFlags = [
    "-DDocBookXML4_DTD_DIR=${docbook_xml_dtd_45}/xml/dtd/docbook"
    "-DDocBookXSL_DIR=${docbook_xsl_ns}/xml/xsl/docbook"
  ];
 
  shellHook = ''
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${libpaths}:/home/prehonor/CLionProjects/EQL5
    export PATH=$PATH:/home/prehonor/CLionProjects/EQL5
    # 对lisp环境没什么影响
    export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
    export PATH=$PATH:"$(rustc --print sysroot)/bin/":"$CARGO_HOME/bin:/home/prehonor/.local/bin"
    export DocBookXML4_DTD_DIR=${docbook_xml_dtd_45}/xml/dtd/docbook
    export DocBookXSL_DIR=${docbook_xsl_ns}/xml/xsl/docbook
  '';
    
}
