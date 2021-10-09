with import <nixpkgs> {}; 
mkShell rec { 
  
  product = "CLion";
  python = python3.withPackages(ps: with ps; [ pip urllib3 ]);

  buildInputs = [

    autoPatchelfHook
    bash
    jdk11
    qt5.full

 
    cmake
    autoconf
    gmock
    boost172_my
    python
    openssl.dev
    mysql80
    libmysqlconnectorcpp
    libmysqlclient

    gcc 
    gdb 



   
   libxml2 libxslt openssl 
   llvm_12 lldb_12 clang_12
   llvmPackages_12.libclang
   pkg-config
   zlib

   # 编译openjdk必须的环镜
   xorg.libX11 xorg.libICE xorg.libXrender xorg.libXext xorg.libXtst xorg.libXt xorg.libXtst
   xorg.libXi xorg.libXinerama xorg.libXcursor xorg.libXrandr cups fontconfig alsaLib libjpeg giflib libpng lcms2

   gtk3 webkitgtk gdk-pixbuf libdrm mesa
   gnome2.gnome_vfs gnome2.GConf
   libGL libglvnd cairo pango
    
  ];

  libs = with xorg; [
      alsaLib atk  cups dbus expat fontconfig gnome2.GConf gdk-pixbuf glib gtk2
      libX11 libxcb libXcomposite libXcursor libXdamage libXext libXfixes libXi
      libXrandr libXrender libXScrnSaver libXtst nspr nss libpulseaudio
      systemd at-spi2-core at-spi2-atk
      libdrm mesa
    ];

  ld = lib.makeLibraryPath ([
      stdenv.cc.cc.lib  glibc # fontconfig.lib
      
  ] ++ libs);
/*
  nativeBuildInputs = [
    openssl.dev
    
    ];*/
  
  shellHook = ''
  

    export ANDROID_HOME="/gh/prehonor/Android/Sdk"
    export MAVEN_OPTS='-Xms300m -Xmx300m'


    export JAVA_CPPFLAGS=-I${jdk11}/include/
    export JAVA_HOME=${jdk11.home}
    export ANT_HOME="/ah/prehonor/Programmers/apache-ant-1.10.8"


    


    export CARGO_HOME="$HOME/.cargo/"
    export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"


    export PATH=$PATH:"$(rustc --print sysroot)/bin/":"$CARGO_HOME/bin":"/home/prehonor/.local/bin":"/ah/prehonor/.npm/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator"



    export LD_LIBRARY_PATH=${ld}:/home/prehonor/Public/test:$LD_LIBRARY_PATH


    export LIBCLANG_PATH="${llvmPackages_12.libclang.lib}/lib"

    # idea 调试 rust 会下载本地调试插件和lldb调试器 ，需要patchelf

    # export LD_LIBRARY_PATH=/home/prehonor/.cache/JetBrains/IntelliJIdea2021.2/intellij-rust/lldb/lib::$LD_LIBRARY_PATH
   
    # autoPatchelf /home/prehonor/.cache/JetBrains/IntelliJIdea2021.2/intellij-rust/lldb/bin
    # autoPatchelf /ah/prehonor/.npm

    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
  '';
}


