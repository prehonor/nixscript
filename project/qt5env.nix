with import <nixpkgs> {}; 
(mkShell.override { stdenv = llvmPackages_13.stdenv; }) rec { # llvmPackages.libcxxStdenv clangStdenv
  name = "qt5env";
  buildInputs = [
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qtdeclarative
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtwebchannel
    libsForQt5.qt5.qtwebsockets
    libsForQt5.qt5.qtwebengine
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qttools
    libsForQt5.qt5.qtmultimedia
    # glibc.dev
    llvmPackages_13.libclang
    llvmPackages_13.libcxx
    llvmPackages_13.llvm
    ecl
    openssl
    readline
  ];
  #  -isystem ${libcxx.dev}/include/c++/v1 -isystem ${llvm.dev}/include/llvm/Support
  nativeBuildInputs = [libsForQt5.qt5.qmake cmake pkg-config];
  # hardeningDisable = [ "all" ];
  # CXXFLAGS = "-I${libcxx.dev}/include/c++/v1";
  libpaths = lib.makeLibraryPath [ openssl ];
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
      "-I${llvmPackages_13.libcxx.dev}/include/c++/v1"
    ];
  shellHook = ''
    # export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/prehonor/.local/lib
    # export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -isystem ${libcxx.dev}/include/c++/v1 -isystem ${glibc.dev}/include"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${libpaths}:/home/prehonor/CLionProjects/EQL5
    export PATH=$PATH:/home/prehonor/CLionProjects/EQL5
  '';
    
}
