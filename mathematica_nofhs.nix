with import <nixpkgs> {}; 
stdenv.mkDerivation rec { 
  
  name = "CLion-env";
  python = python3.withPackages(ps: with ps; [ pip urllib3 pytorch-bin torchvision-bin]); # pytorchWithoutCuda
  public_libs = [
    libGL gnome2.GConf
    linuxPackages.nvidia_x11 cudaPackages.cudatoolkit_11 cudnn_cudatoolkit_11_2  nccl_cudatoolkit_11
  ];
  buildInputs = [

     # openjfx11
   # jdk
   gtk2 gtk3 webkitgtk gdk-pixbuf cairo pango
   atk 
    perl
    # libselinux
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
    autoPatchelfHook

    xorg.libX11
    xorg.libXext
    xorg.libXtst
    xorg.libXi
    xorg.libXmu
    xorg.libXrender
    xorg.libxcb
    xorg.libXcursor
    xorg.libXfixes
    xorg.libXrandr
    xorg.libICE
    xorg.libSM
    
    xorg.libXdamage
    xorg.libXcomposite
    xorg.libXScrnSaver
    xorg.libXt
    xorg.libXxf86vm
    
    
  ] ;
  ld = lib.makeLibraryPath ([
      stdenv.cc.cc.lib  glibc
      
  ] ++ buildInputs);

  
  shellHook = ''
  

    export ANDROID_HOME="/gh/prehonor/Android/Sdk"
    export MAVEN_OPTS='-Xms300m -Xmx300m'


    export JAVA_CPPFLAGS=-I${jdk}/include/
    export JAVA_HOME=${jdk.home}
    export ANT_HOME="/ah/prehonor/Programmers/apache-ant-1.10.8"


    export CARGO_HOME="$HOME/.cargo/"
    export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"


    export PATH=$PATH:"$(rustc --print sysroot)/bin/":"$CARGO_HOME/bin":"$HOME/.local/bin":"$HOME/.local/usr/bin":"/ah/prehonor/.npm/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:/gh/prehonor/gitproject/wasmtime/target/debug:/gh/prehonor/gitproject/vcpkg"



    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/prehonor/Public/test:${ld}:${cudaPackages.cudatoolkit_11}/lib

    export LIBCLANG_PATH="${libclang_x.lib}/lib"

    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/prehonor/.local/usr/lib/pkgconfig

   


    export CUDA_HOME=${cudaPackages.cudatoolkit_11}
    export CUDA_PATH=${cudaPackages.cudatoolkit_11}
    export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
    export EXTRA_CCFLAGS="-I/usr/include"
    export PYTHON_LIBRARY=${python}/lib
    export PYTHON_INCLUDE_DIRS=${python}/include/python3.8
    export NCCL_ROOT=${nccl_cudatoolkit_11.dev}
    export CUDNN_ROOT=${cudnn_cudatoolkit_11_2}


    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
    cd /home/prehonor/.local/pythonEnvs/
    source foo/bin/activate
  '';
}


