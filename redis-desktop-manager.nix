with import <nixpkgs> {}; 
mkShell rec { 

  name = "redis-desktop";

  qtlib = [
        libGL
        zlib
        grpc
        protobuf
        openssl
        abseil-cpp
        c-ares
        ];

  buildInputs = [

        pkgs.qt5Full
        pkgs.qtcreator
        cmake
        pkgconfig

        jdk11
        (python3.withPackages(ps: with ps; [ pip urllib3 ]))
        gcc gdb llvm clang 
        libxml2 libxslt
        libmysqlclient

  ] ++ qtlib;

  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib fontconfig.lib 
      
  ] ++ qtlib);

  shellHook = ''
  
    export PATH=:"/home/prehonor/.local/bin":$PATH
    export LD_LIBRARY_PATH=${ld}:$LD_LIBRARY_PATH


    source /home/prehonor/.local/pythonEnvs/foo/bin/activate


    export ANDROID_HOME="/gh/prehonor/Android/Sdk"

    export MAVEN_OPTS='-Xms300m -Xmx300m'


    export JAVA_CPPFLAGS=-I${jdk11}/include/
    export JAVA_HOME=${jdk11.home}
    

    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
                      
  '';
}