with import <nixpkgs> {}; 
mkShell rec {
  name = "jetbrainsJDKRuntime";
  
  
  buildInputs = [
    jetbrains.jdk
    rustup
    coreutils
    libGL
    freetype
    mupdf
    vte
  ];
  
  ld = lib.makeLibraryPath ([
      fontconfig.lib
  ] ++ buildInputs );
  libsforbin = [
    bubblewrap     # Unprivileged sandboxing tool
    # getconf      # 这个不需要手动
    aspcud # Solver for package problems in CUDF format using ASP
  ];
  LibsBinPath = lib.makeBinPath libsforbin;
  host = stdenv.hostPlatform.config;


  shellHook = ''
    export tt=${vte.dev}
    export ANDROID_HOME="/gh/prehonor/Android/Sdk"
    export MAVEN_OPTS='-Xms300m -Xmx300m'



    export JAVA_CPPFLAGS=-I${jdk11}/include/
    export JAVA_HOME=${jdk11.home}
    export ANT_HOME="/ah/prehonor/Programmers/apache-ant-1.10.8"


    


    export CARGO_HOME="$HOME/.cargo/"
    export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"


    export PATH=${LibsBinPath}:$PATH:"$(rustc --print sysroot)/bin/":"$CARGO_HOME/bin":"/home/prehonor/.local/bin":"/ah/prehonor/.npm/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:/gh/prehonor/gitproject/wasmtime/target/debug"



    export LD_LIBRARY_PATH=${ld}:/home/prehonor/Public/test:$LD_LIBRARY_PATH


    '';
}
