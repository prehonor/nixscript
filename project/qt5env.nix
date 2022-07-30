with import <nixpkgs> {}; 
(mkShell.override { stdenv = clangStdenv; }) rec { # llvmPackages.libcxxStdenv
  name = "qt5env";
  stdenv = pkgs.clangStdenv;
  buildInputs = [
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qtdeclarative
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtwebchannel
    libsForQt5.qt5.qtwebsockets
    libsForQt5.qt5.qtwebengine
    libsForQt5.qt5.qtsvg
  ];
  #  -isystem ${libcxx.dev}/include/c++/v1 -isystem ${llvm.dev}/include/llvm/Support
  nativeBuildInputs = [libsForQt5.qt5.qmake cmake pkg-config];
  # hardeningDisable = [ "all" ];
  # CXXFLAGS = "-I${libcxx.dev}/include/c++/v1";
  shellHook = ''
    # export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/prehonor/.local/lib
    export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -isystem ${libcxx.dev}/include/c++/v1"
  '';
    
}
