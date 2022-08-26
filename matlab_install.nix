let 
  pkgs = import <nixpkgs> {};

  fhs = with pkgs; buildFHSUserEnv {
  name = "matlab_install_start";
  targetPkgs = pkgs: (with pkgs;
    [ 
      libselinux      # SELinux core library
      lsb-release     # Prints certain LSB (Linux Standard Base) and Distribution information
      udev
      coreutils       # The basic file, shell and text manipulation utilities of the GNU operating system
      alsaLib
      dpkg
      gcc
      
      freetype        # A font rendering engine
      glib
      zlib
      fontconfig
      openssl
      which
      ncurses
      jdk
      pam
      dbus_glib
      dbus
      pango
      gtk2-x11
      atk
      gdk_pixbuf
      cairo

      cups
      libfakeXinerama
      nss
      nspr

      libdrm mesa  at-spi2-atk at-spi2-core 
      # libudev0-shim libgcrypt libgudev e2fsprogs expat SDL2


    ]) ++ (
    with pkgs.xorg;
    [ 
      libX11
	    libXft
      libXcursor
      libXrandr
      libXext
      libSM
      libICE
      libX11
      libXrandr
      libXdamage
      libXrender
      libXfixes
      libXcomposite
      libXcursor
      libxcb
      libXi
      libXScrnSaver
      libXtst
      libXt
      libXxf86vm
    ]
    );


  runScript = ''
    bash
  '';

  profile = ''
    export MATLABROOT=/ah/prehonor/Programmers/MATLAB/R2021b
    source /home/prehonor/.local/pythonEnvs/spider/bin/activate

  '';

};

in with pkgs; stdenv.mkDerivation rec {
  name = "matlab_with_clion";
  python = python3.withPackages(ps: with ps; [ pip urllib3 pytorch-bin torchvision-bin pyside2 setuptools ]); # pytorchWithoutCuda
  public_libs = [
    libGL gnome2.GConf
    linuxPackages.nvidia_x11 cudaPackages.cudatoolkit_11 cudnn_cudatoolkit_11  nccl_cudatoolkit_11
    libpng12
  ];

  rizin_libs = [
    file
    libzip
    capstone
    readline
    libusb-compat-0_1
    libewf
    perl
    zlib
    lz4
    openssl
    libuv
    tree-sitter
    xxHash
  ];


  okular_b_nb = [
    breeze-icons discount djvulibre ebook_tools 
    libsForQt5.kactivities libsForQt5.karchive libsForQt5.kbookmarks
    libsForQt5.kcompletion libsForQt5.kconfig libsForQt5.kconfigwidgets libsForQt5.kcoreaddons libsForQt5.kdbusaddons libsForQt5.kdegraphics-mobipocket libsForQt5.kiconthemes libsForQt5.kjs libsForQt5.khtml libsForQt5.kio libsForQt5.kparts libsForQt5.kpty libsForQt5.kpurpose libsForQt5.kwallet
    libsForQt5.kwindowsystem libsForQt5.libkexiv2 libspectre libzip libsForQt5.phonon libsForQt5.poppler libsForQt5.qca-qt5 libsForQt5.qt5.qtdeclarative libsForQt5.qt5.qtsvg libsForQt5.threadweaver libsForQt5.kcrash
  ];

  buildInputs = [

    python

    autoPatchelfHook

    curl
 
    qt5.full
    jdk
    

    boost liburing gmock libmysqlclient libmysqlconnectorcpp
    
 
    openssl.dev
    mysql80
    ocrmypdf
    
   
   libxml2 libxslt openssl 

   # 编译openjdk必须的环镜
   xorg.libICE xorg.libXrender xorg.libXtst xorg.libXt
   xorg.libXinerama xorg.libXcursor
   xorg.libXi xorg.libXmu freeglut
   xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr 
   ncurses5 stdenv.cc binutils # gnumake gitFull # git gitRepo
   cups fontconfig alsaLib libjpeg giflib libpng lcms2

   gnupg
   procps utillinux m4 gperf unzip


   webkitgtk gdk-pixbuf libdrm mesa gtk3
   gnome2.gnome_vfs
   libglvnd cairo pango


   libsodium

   libcap # golang


   graphviz
   libsForQt5.syntax-highlighting
   libsForQt5.qt5.qtdeclarative
   libsForQt5.qt5.qtwebkit
   # unixODBCDrivers.mysql 
    
  ] ++ public_libs ++ rizin_libs;


  nativeBuild_okular = [
    extra-cmake-modules libsForQt5.kdoctools
  ] ++ okular_b_nb;


  libs = with xorg; [
      alsaLib atk  cups dbus expat   gdk-pixbuf glib gtk2 
      # fontconfig libXtst libXext libXi libXrandr libX11 libXcursor mesa libdrm
      libxcb libXcomposite  libXdamage libXfixes
      libXrender libXScrnSaver nspr nss libpulseaudio
      systemd at-spi2-core at-spi2-atk zlib 
      
       
    ] ++ public_libs ++ okular_b_nb;

  nativeBuildInputs = [ 
    pkg-config cmake ninja rustup autoconf meson
    python
    clang_x
    unixODBC
    # llvm_x lld_x lldb_x clang_x libclang_x   # gcc gdb 
  ] ++ nativeBuild_okular ++ [ fhs ];


  ld = lib.makeLibraryPath ([
      stdenv.cc.cc.lib  glibc  # fontconfig.lib python38Packages.pytorch-bin 
      
  ] ++ libs);


  GOROOT = "${pkgs.go.out}/share/go";
  CFLAGS="-I${pkgs.glibc.dev}/include";
  hardeningDisable = [ "all" ];  # 为了解决cgo warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
  LDFLAGS="-L${pkgs.glibc}/lib";

  
  shellHook = ''
  

    export ANDROID_HOME="/gh/prehonor/Android/Sdk"
    export MAVEN_OPTS='-Xms300m -Xmx300m'
    export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator


    export JAVA_CPPFLAGS=-I${jdk}/include/
    export JAVA_HOME=${jdk.home}
    export ANT_HOME="/ah/prehonor/Programmers/apache-ant-1.10.8"


    export CARGO_HOME="$HOME/.cargo/"
    export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
    export PATH=$PATH:"$(rustc --print sysroot)/bin/":"$CARGO_HOME/bin"


    export PATH=$PATH:"$HOME/.local/bin":"$HOME/.local/usr/bin":"/ah/prehonor/.npm/bin:/gh/prehonor/gitproject/wasmtime/target/debug:/gh/prehonor/gitproject/vcpkg"



    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}:/home/prehonor/Public/test:${cudaPackages.cudatoolkit_11}/lib

    export LIBCLANG_PATH="${libclang_x.lib}/lib"

    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/prehonor/.local/usr/lib/pkgconfig

    # idea 调试 rust 会下载本地调试插件和lldb调试器 ，需要patchelf

    # export LD_LIBRARY_PATH=/home/prehonor/.cache/JetBrains/IntelliJIdea2021.2/intellij-rust/lldb/lib::$LD_LIBRARY_PATH
   
    # autoPatchelf /home/prehonor/.cache/JetBrains/IntelliJIdea2021.2/intellij-rust/lldb/bin
    # autoPatchelf /ah/prehonor/.npm


    export CUDA_HOME=${cudaPackages.cudatoolkit_11}
    export CUDA_PATH=${cudaPackages.cudatoolkit_11}
    export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
    export EXTRA_CCFLAGS="-I/usr/include"
    export PYTHON_LIBRARY=${python}/lib
    export PYTHON_INCLUDE_DIRS=${python}/include/python3.8
    export NCCL_ROOT=${nccl_cudatoolkit_11.dev}
    export CUDNN_ROOT=${cudnn_cudatoolkit_11}

    # export PIP_PREFIX=/home/prehonor/.local/pythonEnvs/pip_packages
    # export PYTHONPATH="$PIP_PREFIX/${python.sitePackages}:$PYTHONPATH"
    # export PATH="$PIP_PREFIX/bin:$PATH"
    # unset SOURCE_DATE_EPOCH

    
    export GOROOT=${GOROOT}
    export GOPATH="$HOME/go"
    export GOPROXY="https://mirrors.aliyun.com/goproxy/"


    export JULIA_PKG_SERVER=https://mirrors.tuna.tsinghua.edu.cn/julia
    export GUROBI_HOME="/gh/prehonor/opt/gurobi810/linux64"
    export GRB_LICENSE_FILE="/gh/prehonor/opt/gurobi810/gurobi.lic"
    export PATH=$PATH:$GUROBI_HOME/bin
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}:$GUROBI_HOME/lib
    export LIBPATH=${ld}


    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
    

    LIBRARY_PATH=""
    for b in ${toString (map lib.getLib rizin_libs)}; do
      if [[ -d "$b/lib" ]]; then
        LIBRARY_PATH="$b/lib''${LIBRARY_PATH:+:}$LIBRARY_PATH"
      fi
    done

    export LIBRARY_PATH


    exec matlab_install_start


  '';

}


/*
    inherit (import ./common/pythonlib.nix { python = python3; version = "python3.9"; }) mypy mypy_v;
    publibs = import ./common/otherlib.nix { inherit pkgs; };
    xlibs = import ./common/xorglib.nix { inherit pkgs; };
    qtlibs = import ./common/qtlib.nix { inherit pkgs; };
    

    buildInputs = [
      mypy
      autoPatchelfHook
    ] ++ publibs ++ xlibs ++ qtlibs;


    libs = buildInputs;

    toollibs = import ./common/devtools.nix { inherit pkgs; };

    nativeBuildInputs = toollibs;


    ld = lib.makeLibraryPath ([
        stdenv.cc.cc.lib fontconfig.lib 
    ] ++ libs);


    GOROOT = "${go.out}/share/go";
    CFLAGS="-I${glibc.dev}/include";
    hardeningDisable = [ "all" ];  # 为了解决cgo warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
    LDFLAGS="-L${glibc}/lib";
*/